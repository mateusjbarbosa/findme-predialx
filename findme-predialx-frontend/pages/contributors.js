import React from 'react';

import PageWrapper from '../src/components/wrappers/PageWrapper';
import Table from '../src/components/Table';

export default function Contributors() {
  const tableHeaders = ['id', 'nome', 'e-mail', 'ações'];

  const content = [
    { id: '1234-5678-90', name: 'Jane Cooper', email: 'jane.cooper@mail.com' },
    { id: '1234-5678-90', name: 'Jane Cooper', email: 'jane.cooper@mail.com' },
    { id: '1234-5678-90', name: 'Jane Cooper', email: 'jane.cooper@mail.com' },
  ];

  return (
    <PageWrapper>
      <div className="flex px-16 pt-16 justify-between">
        <h2 className="font-bold text-3xl">Colaboradores</h2>
        <button type="button" className="py-2 px-4 shadow-inner rounded-md text-center text-base bg-red-500 text-white font-bold">novo colaborador</button>
      </div>
      <Table tableHeaders={tableHeaders} content={content} />
    </PageWrapper>
  );
}
