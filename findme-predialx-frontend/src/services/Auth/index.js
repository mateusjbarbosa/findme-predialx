import { parseCookies } from 'nookies';

import jwt from 'jsonwebtoken';

import { LOGIN_APP_TOKEN } from '../Infra';

const authService = (context) => {
  const cookies = parseCookies(context);
  const token = cookies[LOGIN_APP_TOKEN];

  return {
    async hasActiveSession() {
      return token !== undefined;
    },
    async getSession() {
      const session = jwt.decode(token);

      return {
        username: session.preferred_username,
      };
    },
    getToken() {
      return token;
    },
  };
};

const verifySession = async (context) => {
  const auth = authService(context);
  const hasActiveSession = await auth.hasActiveSession();
  const currentPath = context.resolvedUrl;

  if (hasActiveSession) {
    const session = await auth.getSession();
    const token = auth.getToken();

    return {
      props: {
        allowedRoutes: [
          { slug: '/', name: 'home' },
          { slug: '/clients', name: 'clientes' },
          { slug: '/contributors', name: 'colaboradores' },
          { slug: '/service-orders', name: 'ordens de serviço' },
          { slug: '/map', name: 'mapa' },
        ],
        username: session.username,
        token,
      },
    };
  }

  if ((currentPath !== '/') && (currentPath !== '/login')) {
    if (context.res) {
      context.res.writeHead(307, { Location: '/login' });
      context.res.end();
    }
  }

  return {
    props: {
      allowedRoutes: [
        { slug: '/', name: 'home' },
        { slug: '/login', name: 'entrar 🔒' },
      ],
    },
  };
};

export { authService, verifySession };
