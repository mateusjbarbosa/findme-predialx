import { Body, Controller, HttpCode, Param, Post } from '@nestjs/common';

import { Public } from 'nestjs-keycloak-admin';

import { AuthService } from './auth.service';

import { User } from 'src/user/user.entity';

interface UserCredentials {
  username: string;
  password: string;
}

@Controller('auth')
export class AuthController {
  constructor(private authService: AuthService) {}

  @Post('/login')
  @Public()
  async login(@Body() credentials: UserCredentials): Promise<User> {
    return await this.authService.login(
      credentials.username,
      credentials.password,
    );
  }

  @Post('/logout/:userId')
  @HttpCode(204)
  async logout(@Param('userId') userId: string) {
    return await this.authService.logout(userId);
  }
}
