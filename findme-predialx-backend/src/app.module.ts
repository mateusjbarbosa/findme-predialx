import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { APP_GUARD } from '@nestjs/core';

import KeycloakModule, {AuthGuard} from 'nestjs-keycloak-admin';

// this.keycloakService.connect.grantManager.obtainDirectly(username, pass);

@Module({
  imports: [
    ConfigModule.forRoot(),
    KeycloakModule.registerAsync({
      useFactory: () => {
        const keycloakConfig = JSON.parse(process.env.KEYCLOAK_JSON);
        return {
          baseUrl: keycloakConfig['auth-server-url'],
          realmName: keycloakConfig['realm'],
          clientId: keycloakConfig['resource'],
          clientSecret: keycloakConfig['credentials']['secret'],
        };
      },
    })
  ],
  controllers: [],
  providers: [{provide: APP_GUARD, useClass: AuthGuard}],
})
export class AppModule {}
