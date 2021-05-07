import { HttpClient, BACKEND_URL } from '../Infra';

const authService = {
  async login({ username, password }) {
    return HttpClient(`${BACKEND_URL}/auth/login`, {
      method: 'POST',
      body: {
        username,
        password,
      },
    }).then((response) => {
      const { token, email } = response;
      if (!token) {
        throw new Error('Failed to login');
      }

      return [token, email];
    });
  },
};

export { authService };
