import React, { useEffect, useState } from 'react';

import PageWrapper from '../src/components/wrappers/PageWrapper';
import TableUsers from '../src/components/Table/tableUsers';

import { FormContributorRegister } from '../src/components/Forms/Register';

import { verifySession } from '../src/services/Auth';

import userService from '../src/services/User';
import Button from '../src/components/commons/Button';

// eslint-disable-next-line react/prop-types
export default function Contributors({ allowedRoutes, username, token }) {
  const [content, setContent] = useState([]);
  const [register, setRegister] = useState(false);

  const tableHeaders = ['id', 'nome', 'e-mail', 'ações'];

  useEffect(async () => {
    const getUsers = await userService.getUsersByRole(token, 'contributor');

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
        <h2 className="font-bold text-3xl">Colaboradores</h2>
        <Button
          type="button"
          variant="primary"
          onClick={() => setRegister(!register)}
        >
          novo colaborador
        </Button>
      </div>
      {register ? (
        <FormContributorRegister
          sucessAlert="colaborador cadastrado com sucesso!"
          errorAlert="colaborador não cadastrado!"
          userRole="contributor"
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
