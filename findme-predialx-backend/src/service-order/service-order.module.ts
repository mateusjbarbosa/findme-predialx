import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';

import { ServiceOrder } from './service-order.entity';
import { ServiceOrderController } from './service-order.controller';
import { ServiceOrderService } from './service-order.service';

import { UserService } from 'src/user/user.service';
import { DatabaseService } from 'src/database/database.service';

@Module({
  imports: [TypeOrmModule.forFeature([ServiceOrder])],
  controllers: [ServiceOrderController],
  providers: [ServiceOrderService, UserService, DatabaseService],
})
export class ServiceOrderModule {}
