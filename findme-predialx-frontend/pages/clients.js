import React, { useEffect, useState } from 'react';

import PageWrapper from '../src/components/wrappers/PageWrapper';
import TableUsers from '../src/components/Table/tableUsers';

import { FormClientRegister } from '../src/components/Forms/Register';

import { verifySession } from '../src/services/Auth';
import userService from '../src/services/User';
import Button from '../src/components/commons/Button';

// eslint-disable-next-line react/prop-types
export default function Clients({ allowedRoutes, username, token }) {
  const [content, setContent] = useState([]);
  const [register, setRegister] = useState(false);

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
    <PageWrapper
      allowedRoutes={allowedRoutes}
      username={username}
      token={token}
    >
      <div className="flex px-16 pt-16 justify-between">
        <h2 className="font-bold text-3xl">Clientes</h2>
        <Button
          type="button"
          variant="primary"
          onClick={() => setRegister(!register)}
        >
          novo cliente
        </Button>
      </div>
      {register ? (
        <FormClientRegister
          sucessAlert="cliente cadastrado com sucesso!"
          errorAlert="cliente não cadastrado!"
          userRole="client"
          token={token}
        />
      ) : (
        <div />
      )}
      <TableUsers tableHeaders={tableHeaders} content={content} />
    </PageWrapper>
  );
}

export async function getServerSideProps(context) {
  const result = await verifySession(context);

  return {
    ...result,
  };
}
