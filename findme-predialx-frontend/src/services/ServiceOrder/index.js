import { HttpClient, BACKEND_URL } from '../Infra';

const serviceOrderService = {
  async getServiceOrders(token) {
    return HttpClient(`${BACKEND_URL}/service-order`, {
      method: 'GET',
      headers: {
        authorization: `Bearer ${token}`,
      },
    }).then((response) => response);
  },
};

export default serviceOrderService;
