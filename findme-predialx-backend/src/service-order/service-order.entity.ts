import { Entity, PrimaryGeneratedColumn, Column, BaseEntity } from 'typeorm';

@Entity()
export class ServiceOrder extends BaseEntity {
  constructor(
    date: string,
    clientId: string,
    contributorId: string,
    description: string,
  ) {
    super();

    this.date = date;
    this.clientId = clientId;
    this.contributorId = contributorId;
    this.description = description;
  }

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
