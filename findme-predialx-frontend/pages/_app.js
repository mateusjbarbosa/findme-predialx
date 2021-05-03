import React from 'react';

// eslint-disable-next-line import/no-extraneous-dependencies
import 'tailwindcss/tailwind.css';

// eslint-disable-next-line react/prop-types
function MyApp({ Component, pageProps }) {
  // eslint-disable-next-line react/jsx-props-no-spreading
  return <Component {...pageProps} />;
}

export default MyApp;
