import React from 'react';

import Header from '../Header';

// eslint-disable-next-line react/prop-types
export default function PageWrapper({ children }) {
  return (
    <>
      <Header />
      {children}
    </>
  );
}
