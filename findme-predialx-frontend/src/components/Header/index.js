import React from 'react';

import Link from 'next/link';
import { useRouter } from 'next/router';

export default function Header() {
  const router = useRouter();

  const defaultStyle = 'px-4 font-bold text-white opacity-50 hover:opacity-100 transition';
  const activeStyle = 'px-4 py-2 font-bold text-white bg-red-600 shadow-inner rounded-md';

  const items = [
    { slug: '/', name: 'home' },
    { slug: '/clients', name: 'clientes' },
    { slug: '/contributors', name: 'colaboradores' },
    { slug: '/service-orders', name: 'ordens de serviço' },
    { slug: '/map', name: 'mapa' },
    { slug: '/login', name: 'entrar 🔒' },
  ];

  return (
    <header className="bg-red-500 flex justify-between items-center px-16 py-8">
      <h1 className="text-xl font-bold text-white">findme • predialx</h1>
      <nav>
        <ul className="flex items-center justify-around">
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
        </ul>
      </nav>
    </header>
  );
}
