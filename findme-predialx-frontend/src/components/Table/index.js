import React from 'react';

// eslint-disable-next-line react/prop-types
export default function Table({ tableHeaders, content }) {
  return (
    <div className="flex flex-col px-16 pt-8">
      <div className="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
        <div className="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
          <div className="shadow overflow-hidden border-b border-gray-200 sm:rounded-lg">
            <table className="min-w-full divide-y divide-gray-200">
              <thead className="bg-red-500">
                <tr>
                  {/* eslint-disable-next-line react/prop-types */}
                  {tableHeaders.map((header) => (
                    <th
                      key={header}
                      scope="col"
                      className="px-6 py-3 text-left text-xs font-medium text-white uppercase tracking-wider"
                    >
                      {header}
                    </th>
                  ))}
                </tr>
              </thead>
              <tbody className="bg-white divide-y">
                {/* eslint-disable-next-line react/prop-types */}
                {content.map((td) => (
                  <tr key={td.id}>
                    <td className="px-6 py-4 whitespace-nowrap">
                      <div className="text-sm text-gray-900">{td.id}</div>
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap">
                      <div className="text-sm text-gray-900">{td.name}</div>
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap">
                      <div className="text-sm text-gray-900">{td.email}</div>
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap">
                      <div className="flex">
                        <div className="py-2 px-4 shadow-inner rounded-md bg-gray-200 text-center text-sm font-medium text-gray-900">
                          editar
                        </div>
                        <div className="mx-4 py-2 px-4 shadow-inner rounded-md text-center text-sm bg-red-500 text-white">
                          excluir
                        </div>
                      </div>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  );
}
