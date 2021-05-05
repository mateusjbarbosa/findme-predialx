import { setCookie, destroyCookie } from 'nookies';

import jwt from 'jsonwebtoken';

import { HttpClient, BACKEND_URL, LOGIN_APP_TOKEN } from '../Infra';

const loginService = {
  async login(
    { username, password },
  ) {
    return HttpClient(`${BACKEND_URL}/auth/login`, {
      method: 'POST',
      body: {
        username,
        password,
      },
    }).then((response) => {
      const { token } = response;
      if (!token) {
        throw new Error('Failed to login');
      }

      const MAX_AGE_TOKEN = 30 * 60; // 30 minutos

      setCookie(null, LOGIN_APP_TOKEN, token, {
        path: '/',
        maxAge: MAX_AGE_TOKEN,
      });
    });
  },

  async logout(
    token,
  ) {
    destroyCookie(null, LOGIN_APP_TOKEN);

    const data = jwt.decode(token);

    return HttpClient(`${BACKEND_URL}/auth/logout/${data.sub}`, {
      method: 'POST',
      headers: {
        authorization: `Bearer ${token}`,
      },
    });
  },
};

export default loginService;
