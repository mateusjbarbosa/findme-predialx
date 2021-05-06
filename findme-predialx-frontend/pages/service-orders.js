import React, { useEffect, useState } from 'react';

import PageWrapper from '../src/components/wrappers/PageWrapper';
import TableServiceOrders from '../src/components/Table/tableServiceOrders';

import { verifySession } from '../src/services/Auth';
import serviceOrderService from '../src/services/ServiceOrder';

// eslint-disable-next-line react/prop-types
export default function ServiceOrders({ allowedRoutes, username, token }) {
  const [content, setContent] = useState([]);

  const tableHeaders = ['id', 'data', 'cliente', 'colaborador', 'descrição'];

  useEffect(async () => {
    const getServiceOrders = await serviceOrderService.getServiceOrders(token);
    const listServiceOrders = [];

    getServiceOrders.forEach((serviceOrder) => {
      listServiceOrders.push(serviceOrder);
    });

    setContent(listServiceOrders);
  }, []);

  return (
    <PageWrapper
      allowedRoutes={allowedRoutes}
      username={username}
      token={token}
    >
      <div className="flex px-16 pt-16 justify-between">
        <h2 className="font-bold text-3xl">Ordens de serviço</h2>
      </div>
      <TableServiceOrders tableHeaders={tableHeaders} content={content} />
    </PageWrapper>
  );
}

export async function getServerSideProps(context) {
  const result = await verifySession(context);

  return {
    ...result,
  };
}
