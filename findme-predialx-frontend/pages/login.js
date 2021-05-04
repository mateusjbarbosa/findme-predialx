import React from 'react';

import PageWrapper from '../src/components/wrappers/PageWrapper';

import LoginForm from '../src/components/Forms/Login';

import { verifySession } from '../src/services/Auth';

// eslint-disable-next-line react/prop-types
export default function LoginPage({ allowedRoutes, username }) {
  return (
    <PageWrapper allowedRoutes={allowedRoutes} username={username}>
      <LoginForm />
    </PageWrapper>
  );
}

export async function getServerSideProps(context) {
  const result = await verifySession(context);

  return {
    ...result,
  };
}
