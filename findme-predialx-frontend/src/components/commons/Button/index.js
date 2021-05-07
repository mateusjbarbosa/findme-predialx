import React from 'react';

export default function Button({
  // eslint-disable-next-line react/prop-types
  type, variant, children, onClick, customStyle,
}) {
  const variants = {
    primary:
      'py-2 px-4 shadow-inner rounded-md text-center font-bold text-sm bg-red-500 text-white focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500',
    secondary:
      'py-2 px-4 shadow-inner rounded-md bg-gray-200 text-center font-bold text-sm font-medium text-gray-900 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-200',
  };

  return (
    <button
      // eslint-disable-next-line react/button-has-type
      type={type}
      className={`${variants[variant]} ${customStyle}`}
      onClick={onClick}
    >
      {children}
    </button>
  );
}
