import { setCookie, destroyCookie } from 'nookies';

const BACKEND_URL = 'http://localhost:3000';

async function HttpClient(url, { headers, body, ...options }) {
  return fetch(url, {
    headers: {
      ...headers,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(body),
    ...options,
  })
    .then((serverResponse) => {
      if (serverResponse.ok) {
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
    })
      .then((response) => {
        const { token } = response;
        if (!token) {
          throw new Error('Failed to login');
        }

        const DAY_IN_SECONDS = 86400;

        setCookieModule(null, 'APP_TOKEN', token, {
          path: '/',
          maxAge: DAY_IN_SECONDS * 7,
        });
      });
  },

  async logout(destroyCookieModule = destroyCookie) {
    destroyCookieModule(null, 'APP_TOKEN');
  },
};

export default loginService;
