import React from 'react';

export default function Input({
  // eslint-disable-next-line react/prop-types
  label, id, type, placeholder, onChange, value, onBlur,
}) {
  return (
    <>
      {/* eslint-disable-next-line jsx-a11y/label-has-associated-control */}
      <label
        htmlFor={id}
        className="font-bold rounded-lg text-sm text-gray-500"
      >
        {label}
      </label>
      <input
        id={id}
        name={id}
        type={type}
        required
        className="rounded w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-red-500 focus:border-red-500 focus:z-10 sm:text-sm"
        placeholder={placeholder}
        onChange={onChange}
        value={value}
        onBlur={onBlur}
      />
    </>
  );
}
