import React from 'react';

import PageWrapper from '../src/components/wrappers/PageWrapper';
import AdminRegisterForm from '../src/components/Forms/Register/adminRegister';

import { verifySession } from '../src/services/Auth';

// eslint-disable-next-line react/prop-types
export default function Home({ allowedRoutes, username, token }) {
  return (
    <PageWrapper
      allowedRoutes={allowedRoutes}
      username={username}
      token={token}
    >
      <AdminRegisterForm
        sucessAlert="administrador cadastrado com sucesso!"
        errorAlert="administrador não cadastrado!"
      />
    </PageWrapper>
  );
}

export async function getServerSideProps(context) {
  const result = await verifySession(context);

  return {
    ...result,
  };
}
