import React from 'react';

import PageWrapper from '../src/components/wrappers/PageWrapper';

import { verifySession } from '../src/services/Auth';

// eslint-disable-next-line react/prop-types
export default function Map({ allowedRoutes, username, token }) {
  return (
    <PageWrapper allowedRoutes={allowedRoutes} username={username} token={token}>
      <h2>map</h2>
    </PageWrapper>
  );
}

export async function getServerSideProps(context) {
  const result = await verifySession(context);

  return {
    ...result,
  };
}
