import React from 'react';

// eslint-disable-next-line react/prop-types
export default function TableServiceOrders({ tableHeaders, content }) {
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
                      <p className="text-sm text-gray-400">{td.id}</p>
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap">
                      <p className="text-sm text-gray-900">{td.date}</p>
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap">
                      <p className="text-sm text-gray-900">{td.clientName}</p>
                      <p className="text-sm text-gray-500">{td.clientId}</p>
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap">
                      <p className="text-sm text-gray-900">
                        {td.contributorName}
                      </p>
                      <p className="text-sm text-gray-500">
                        {td.contributorId}
                      </p>
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap">
                      <p className="text-sm">{td.description}</p>
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
