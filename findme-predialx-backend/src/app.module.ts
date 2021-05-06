import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { APP_GUARD } from '@nestjs/core';

import KeycloakModule, {
  AuthGuard,
  ResourceGuard,
} from 'nestjs-keycloak-admin';

import { TypeOrmModule } from '@nestjs/typeorm';

import { ServiceOrder } from './service-order/service-order.entity';

import { UserModule } from './user/user.module';
import { AuthModule } from './auth/auth.module';
import { ServiceOrderModule } from './service-order/service-order.module';

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
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: process.env.TYPEORM_DATABASE_HOST,
      port: parseInt(process.env.TYPEORM_DATABASE_PORT),
      username: process.env.TYPEORM_DATABASE_USERNAME,
      password: process.env.TYPEORM_DATABASE_PASSWORD,
      database: process.env.TYPEORM_DATABASE_DATABASE,
      entities: [ServiceOrder],
      synchronize: true,
    }),
    UserModule,
    AuthModule,
    ServiceOrderModule,
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
