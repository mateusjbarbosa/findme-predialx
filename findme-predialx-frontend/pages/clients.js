import React, { useEffect, useState } from 'react';

import PageWrapper from '../src/components/wrappers/PageWrapper';
import Table from '../src/components/Table';

import { verifySession } from '../src/services/Auth';

import userService from '../src/services/User';

// eslint-disable-next-line react/prop-types
export default function Clients({ allowedRoutes, username, token }) {
  const [content, setContent] = useState([]);

  const tableHeaders = ['id', 'nome', 'e-mail', 'ações'];

  useEffect(async () => {
    const getUsers = await userService.getUsersByRole(token, 'client');

    const listUsers = [];

    getUsers.forEach((user) => {
      const parsedUser = {
        id: user.id,
        name: `${user.first_name} ${user.last_name}`,
        email: user.email,
        username: user.username,
      };

      listUsers.push(parsedUser);
    });

    setContent(listUsers);
  }, []);

  return (
    <PageWrapper allowedRoutes={allowedRoutes} username={username} token={token}>
      <div className="flex px-16 pt-16 justify-between">
        <h2 className="font-bold text-3xl">Clientes</h2>
        <button type="button" className="py-2 px-4 shadow-inner rounded-md text-center text-base bg-red-500 text-white font-bold">novo cliente</button>
      </div>
      <Table tableHeaders={tableHeaders} content={content} />
    </PageWrapper>
  );
}

export async function getServerSideProps(context) {
  const result = await verifySession(context);

  return {
    ...result,
  };
}
