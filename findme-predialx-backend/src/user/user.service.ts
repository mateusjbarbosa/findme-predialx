import { Injectable } from '@nestjs/common';

import { KeycloakService } from 'nestjs-keycloak-admin';

import { DatabaseService } from 'src/database/database.service';

@Injectable()
export class UserService {
  constructor(
    private keycloakService: KeycloakService,
    private databaseService: DatabaseService,
  ) {}

  private async getRoles() {
    const remoteRoles = this.keycloakService.client.roles;
    const roles = await remoteRoles.find();

    return roles;
  }

  async createUser(data: {
    firstName: string;
    lastName: string;
    username: string;
    email: string;
    password: string;
    role: string;
  }) {
    const remoteUser = this.keycloakService.client.users;
    const remoteRoles = await this.getRoles();

    const createdUser = await remoteUser.create({
      firstName: data.firstName,
      lastName: data.lastName,
      username: data.username,
      email: data.email,
      credentials: [{ value: data.password }],
      enabled: true,
    });

    const userRole = remoteRoles.find((r) => r.name === data.role);

    await remoteUser.addRealmRoleMappings({
      id: createdUser.id,
      roles: [{ id: userRole.id, name: userRole.name }],
    });

    return { userId: createdUser.id };
  }

  async getUsers(role: string) {
    if (role) {
      return await this.databaseService.getUsersByRole(role);
    }

    return await this.databaseService.getAllUsers();
  }
}
