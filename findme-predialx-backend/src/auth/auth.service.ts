import { Injectable } from '@nestjs/common';

import { KeycloakService } from 'nestjs-keycloak-admin';

import { Role, User } from 'src/user/user.entity';

const roleJsonToEnum = {
  admin: Role.ADMIN,
  client: Role.CLIENT,
  contributor: Role.CONTRIBUTOR,
};

@Injectable()
export class AuthService {
  constructor(private keycloakService: KeycloakService) {}

  public async login(username: string, password: string): Promise<User> {
    const response = await this.keycloakService.connect.grantManager.obtainDirectly(
      username,
      password,
    );

    const user: User = {
      firstName: response.access_token['content']['given_name'],
      lastName: response.access_token['content']['family_name'],
      username: response.access_token['content']['preferred_username'],
      email: response.access_token['content']['email'],
      token: response.access_token['token'],
      role:
        roleJsonToEnum[
          response.access_token['content']['realm_access']['roles']
        ],
    };

    return user;
  }

  async logout(userId: string) {
    const remoteUser = this.keycloakService.client.users;

    await remoteUser.logout({ id: userId });
  }
}
