import { Body, Controller, Get, Post } from '@nestjs/common';

import { ServiceOrderService } from './service-order.service';

@Controller('service-order')
export class ServiceOrderController {
  constructor(private serviceOrderService: ServiceOrderService) {}

  @Post('/')
  createServiceOrder(@Body() serviceOrder) {
    return this.serviceOrderService.createServiceOrder(serviceOrder);
  }

  @Get('/')
  getServiceOrders() {
    return this.serviceOrderService.getServiceOrders();
  }
}
