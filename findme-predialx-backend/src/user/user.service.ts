import { Injectable } from '@nestjs/common';

import { KeycloakService } from 'nestjs-keycloak-admin';

@Injectable()
export class UserService {
  constructor(private keycloakService: KeycloakService) {}

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
  }): Promise<string> {
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

    return createdUser.id;
  }

  async getUsers() {
    const remoteUser = this.keycloakService.client.users;

    const result = await remoteUser.find();

    return result;
  }
}
