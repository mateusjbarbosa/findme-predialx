import { Injectable } from '@nestjs/common';
import { Pool } from 'pg';

@Injectable()
export class DatabaseService {
  private pool: Pool;

  constructor() {
    this.pool = new Pool({
      connectionString: process.env.DATABASE_QUERY_CONNECTION,
    });
  }

  private async getConnection() {
    return await this.pool.connect();
  }

  async getUserById(id: string) {
    const database = await this.getConnection();

    const result = await database.query(
      `SELECT ue.first_name, ue.last_name
        FROM user_entity ue
        WHERE ue.realm_id = 'findme-predialx'
          AND ue.id = '${id}';`,
    );

    database.release();

    return `${result.rows[0]['first_name']} ${result.rows[0]['last_name']}`;
  }

  async getAllUsers() {
    const database = await this.getConnection();

    const result = await database.query(
      `SELECT ue.id, ue.first_name, ue.last_name, ue.username, ue.email
        FROM user_entity ue
        WHERE ue.realm_id = 'findme-predialx'
          AND ue.email IS NOT NULL;`,
    );

    database.release();

    return result.rows;
  }

  async getUsersByRole(role: string) {
    const database = await this.getConnection();

    const result = await database.query(
      `SELECT ue.id, ue.first_name, ue.last_name, ue.username, ue.email
        FROM keycloak_role kr
          JOIN user_role_mapping rm ON kr.id = rm.role_id
          JOIN user_entity ue ON rm.user_id = ue.id
        WHERE kr.name = '${role}'
          AND ue.realm_id = 'findme-predialx'
          AND ue.email IS NOT NULL;`,
    );

    database.release();

    return result.rows;
  }
}
