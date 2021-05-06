import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';

import { Repository } from 'typeorm';

import { ServiceOrder } from './service-order.entity';

@Injectable()
export class ServiceOrderService {
  constructor(
    @InjectRepository(ServiceOrder)
    private serviceOrderRepository: Repository<ServiceOrder>,
  ) {}

  createServiceOrder(serviceOrder: ServiceOrder): Promise<ServiceOrder> {
    return this.serviceOrderRepository.save(serviceOrder);
  }

  getServiceOrders(): Promise<ServiceOrder[]> {
    return this.serviceOrderRepository.find();
  }
}
