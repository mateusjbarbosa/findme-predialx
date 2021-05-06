import { HttpClient, BACKEND_URL } from '../Infra';

const userService = {
  async getUsersByRole(token, role) {
    return HttpClient(`${BACKEND_URL}/users?role=${role}`, {
      method: 'GET',
      headers: {
        authorization: `Bearer ${token}`,
      },
    }).then((response) => response);
  },
  async createUser(token, data) {
    return HttpClient(`${BACKEND_URL}/users`, {
      method: 'POST',
      headers: {
        authorization: `Bearer ${token}`,
      },
      body: {
        ...data,
      },
    }).then((response) => response);
  },
};

export default userService;
