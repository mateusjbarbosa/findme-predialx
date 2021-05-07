import React from 'react';

import Link from 'next/link';
import { useRouter } from 'next/router';

import loginService from '../../services/Login';

// eslint-disable-next-line react/prop-types
export default function Header({ items, username, token }) {
  const router = useRouter();

  const defaultStyle = 'px-4 font-bold text-white opacity-50 hover:opacity-100 transition';
  const activeStyle = 'px-4 py-2 font-bold text-white bg-red-600 shadow-inner rounded-md';
  const userLoggedStyle = 'px-4 font-bold text-white opacity-50 hover:opacity-100 transition cursor-default';

  return (
    <header className="bg-red-500 flex justify-between items-center px-16 py-8">
      <h1 className="text-xl font-bold text-white">findme • predialx</h1>
      <nav className="flex">
        <ul className="flex items-center justify-around">
          {/* eslint-disable-next-line react/prop-types */}
          {items.map((item) => (
            <Link href={item.slug} key={item.slug}>
              {/* eslint-disable-next-line jsx-a11y/anchor-is-valid */}
              <a
                className={
                  router.pathname === item.slug ? activeStyle : defaultStyle
                }
              >
                {item.name}
              </a>
            </Link>
          ))}
          {username !== undefined
            ? (
              <li className={userLoggedStyle}>
                olá,
                {' '}
                {username}
                {' '}
                ✌
              </li>
            ) : <></>}
        </ul>
        {username !== undefined
          ? (
            <button
              className={defaultStyle}
              type="button"
              onClick={async () => {
                await loginService.logout(token);
                document.location.reload();
              }}
            >
              sair
            </button>
          ) : <></>}
      </nav>
    </header>
  );
}
