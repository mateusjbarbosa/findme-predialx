const BACKEND_URL = 'http://localhost:3000';

async function HttpClient(url, { headers, body, ...options }) {
  return fetch(url, {
    headers: {
      ...headers,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(body),
    ...options,
  }).then(async (serverResponse) => {
    if (serverResponse.ok) {
      if (serverResponse.status === 204) return '';
      return serverResponse.json();
    }

    throw new Error('Error on get server response.');
  });
}

export { HttpClient, BACKEND_URL };
