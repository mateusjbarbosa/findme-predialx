import React from 'react';

import Header from '../Header';

export default function PageWrapper({
  // eslint-disable-next-line react/prop-types
  allowedRoutes, username, token, children,
}) {
  return (
    <>
      <Header items={allowedRoutes} username={username} token={token} />
      {children}
    </>
  );
}
