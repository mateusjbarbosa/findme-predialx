import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';

import { Repository } from 'typeorm';

import { ServiceOrder } from './service-order.entity';
import { UserService } from 'src/user/user.service';

@Injectable()
export class ServiceOrderService {
  constructor(
    @InjectRepository(ServiceOrder)
    private serviceOrderRepository: Repository<ServiceOrder>,
    private userService: UserService,
  ) {}

  createServiceOrder(serviceOrder: {
    date: string;
    clientId: string;
    contributorId: string;
    description: string;
  }): Promise<ServiceOrder> {
    const so = new ServiceOrder(
      serviceOrder.date,
      serviceOrder.clientId,
      serviceOrder.contributorId,
      serviceOrder.description,
    );

    return this.serviceOrderRepository.save(so);
  }

  async getServiceOrders() {
    const allServiceOrders = await this.serviceOrderRepository.find();

    const parsedServiceOrders = [];

    const promises = allServiceOrders.map(async (serviceOrder) => {
      const clientName = await this.userService.getUserById(
        serviceOrder.clientId,
      );
      const contributorName = await this.userService.getUserById(
        serviceOrder.contributorId,
      );

      parsedServiceOrders.push({
        ...serviceOrder,
        clientName,
        contributorName,
      });
    });

    await Promise.all(promises);

    return parsedServiceOrders;
  }
}
