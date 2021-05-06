import { BACKEND_URL, HttpClient } from '../Infra';

export const userService = {
  getClients(token) {
    return HttpClient(`${BACKEND_URL}/users?role=client`, {
      method: 'GET',
      headers: {
        authorization: `Bearer ${token}`,
      },
    }).then((response) => response);
  },
};
