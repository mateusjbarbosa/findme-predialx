import { setCookie, destroyCookie } from 'nookies';

import jwt from 'jsonwebtoken';

const BACKEND_URL = 'http://localhost:3000';

export const LOGIN_APP_TOKEN = 'LOGIN_APP_TOKEN';

async function HttpClient(url, { headers, body, ...options }) {
  return fetch(url, {
    headers: {
      ...headers,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(body),
    ...options,
  }).then(async (serverResponse) => {
    if (serverResponse.ok) {
      if (serverResponse.status === 204) return '';
      return serverResponse.json();
    }

    throw new Error('Error on get server response.');
  });
}

const loginService = {
  async login(
    { username, password },
    setCookieModule = setCookie,
    HttpClientModule = HttpClient,
  ) {
    return HttpClientModule(`${BACKEND_URL}/auth/login`, {
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

      setCookieModule(null, LOGIN_APP_TOKEN, token, {
        path: '/',
        maxAge: MAX_AGE_TOKEN,
      });
    });
  },

  async logout(
    token,
    destroyCookieModule = destroyCookie,
    HttpClientModule = HttpClient,
  ) {
    destroyCookieModule(null, LOGIN_APP_TOKEN);

    const data = jwt.decode(token);

    return HttpClientModule(`${BACKEND_URL}/auth/logout/${data.sub}`, {
      method: 'POST',
      headers: {
        authorization: `Bearer ${token}`,
      },
    });
  },
};

export default loginService;
