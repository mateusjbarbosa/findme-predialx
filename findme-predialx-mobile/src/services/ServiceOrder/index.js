import { BACKEND_URL, HttpClient } from '../Infra';

export const serviceOrderService = {
  sendServiceOrder(token, data) {
    return HttpClient(`${BACKEND_URL}/service-order`, {
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
