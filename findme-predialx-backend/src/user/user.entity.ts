enum Role {
  ADMIN = 'ADMIN',
  CLIENT = 'CLIENT',
  CONTRIBUTOR = 'CONTRIBUTOR',
}

interface User {
  firstName: string;
  lastName: string;
  username: string;
  email: string;
  token?: string;
  role: Role;
  password?: string;
}

export { Role, User };
