import { Body, Controller, Get, Post, Query } from '@nestjs/common';

import { Public } from 'nestjs-keycloak-admin';

import { User } from './user.entity';
import { UserService } from './user.service';

@Controller('users')
export class UserController {
  constructor(private userService: UserService) {}

  @Post('/')
  @Public()
  createUser(@Body() body: User) {
    return this.userService.createUser({ ...body, password: body.password });
  }

  @Get('/')
  getUsers(@Query() { role }) {
    return this.userService.getUsers(role);
  }
}
