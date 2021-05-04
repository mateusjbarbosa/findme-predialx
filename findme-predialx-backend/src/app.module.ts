import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { APP_GUARD } from '@nestjs/core';

import KeycloakModule, {
  AuthGuard,
  ResourceGuard,
} from 'nestjs-keycloak-admin';

import { UserModule } from './user/user.module';
import { AuthModule } from './auth/auth.module';

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
    }),
    UserModule,
    AuthModule,
  ],
  controllers: [],
  providers: [
    {
      provide: APP_GUARD,
      useClass: AuthGuard,
    },
    {
      provide: APP_GUARD,
      useClass: ResourceGuard,
    },
  ],
})
export class AppModule {}
