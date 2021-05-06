import { Entity, PrimaryGeneratedColumn, Column, BaseEntity } from 'typeorm';

@Entity()
export class ServiceOrder extends BaseEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  date: string;

  @Column()
  clientId: string;

  @Column()
  contributorId: string;

  @Column()
  description: string;
}
