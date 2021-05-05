import React, { useEffect, useState } from 'react';

import * as yup from 'yup';

import PageWrapper from '../src/components/wrappers/PageWrapper';
import Table from '../src/components/Table';

import useForm from '../src/components/Forms/hooks';

import { verifySession } from '../src/services/Auth';
import userService from '../src/services/User';

function Input({
  // eslint-disable-next-line react/prop-types
  label, id, type, placeholder, onChange, value, onBlur,
}) {
  return (
    <>
      {/* eslint-disable-next-line jsx-a11y/label-has-associated-control */}
      <label
        htmlFor={id}
        className="font-bold rounded-lg text-sm text-gray-500"
      >
        {label}
      </label>
      <input
        id={id}
        name={id}
        type={type}
        required
        className="rounded w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-red-500 focus:border-red-500 focus:z-10 sm:text-sm"
        placeholder={placeholder}
        onChange={onChange}
        value={value}
        onBlur={onBlur}
      />
    </>
  );
}

function Button({
  // eslint-disable-next-line react/prop-types
  type, variant, text, onClick, customStyle,
}) {
  const variants = {
    primary:
      'py-2 px-4 shadow-inner rounded-md text-center font-bold text-sm bg-red-500 text-white',
    secondary:
      'py-2 px-4 shadow-inner rounded-md bg-gray-200 text-center font-bold text-sm font-medium text-gray-900',
  };

  return (
    <button
      // eslint-disable-next-line react/button-has-type
      type={type}
      className={`${variants[variant]} ${customStyle}`}
      onClick={onClick}
    >
      {text}
    </button>
  );
}

const registerSchema = yup.object().shape({
  firstName: yup.string().required('O nome é obrigatório'),
  lastName: yup.string().required('O sobrenome é obrigatório'),
  email: yup.string().email().required('O e-mail é obrigatório'),
});

function FormRegister({
  // eslint-disable-next-line react/prop-types
  sucessAlert, errorAlert, userRole, token,
}) {
  const initialValues = {
    firstName: '',
    lastName: '',
    email: '',
  };

  const form = useForm({
    initialValues,
    onSubmit: (values) => {
      form.setIsFormDisabled(true);

      userService
        .createUser(token, {
          firstName: values.firstName,
          lastName: values.lastName,
          email: values.email,
          username: `${values.firstName.replace(/ +/g, '').toLowerCase()}${values.lastName.replace(/ +/g, '')}`,
          role: userRole,
        })
        .then(() => {
          console.log(sucessAlert);
          document.location.reload();
        })
        .catch((err) => {
          console.log(errorAlert, err);
        })
        .finally(() => {
          form.setIsFormDisabled(false);
        });
    },
    async validateSchema(values) {
      return registerSchema.validate(values, {
        abortEarly: false,
      });
    },
  });

  return (
    <div className="flex flex-col px-16 pt-8">
      <h3 className="font-bold bg-gray-100 rounded-lg py-4 px-4 text-2xl">
        cadastrar novo cliente
      </h3>
      <form
        className="flex bg-gray-100 py-4 px-4 rounded-lg"
        onSubmit={form.handleSubmit}
      >
        <div className="pr-8 w-1/3">
          <Input
            label="nome"
            id="firstName"
            type="text"
            placeholder="ex.: Condomínio"
            onChange={form.handleChange}
            value={form.values.firstName}
            onBlur={form.handleBlur}
          />
        </div>
        <div className="pr-8 w-1/3">
          <Input
            label="sobrenome"
            id="lastName"
            type="text"
            placeholder="ex.: Estrela Azul"
            onChange={form.handleChange}
            value={form.values.lastName}
            onBlur={form.handleBlur}
          />
        </div>
        <div className="pr-8 w-1/3">
          <Input
            label="e-mail do cliente"
            id="email"
            type="email"
            placeholder="ex.: estrelaazul@condiminio.com.br"
            onChange={form.handleChange}
            value={form.values.email}
            onBlur={form.handleBlur}
          />
        </div>
        <div className="flex items-end py-0.5">
          <Button
            type="submit"
            variant="primary"
            text="adicionar"
            customStyle="mr-4"
          />
          <Button
            type="button"
            variant="secondary"
            text="cancelar"
          />
        </div>
      </form>
    </div>
  );
}

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
        <button
          type="button"
          className="py-2 px-4 shadow-inner rounded-md text-center text-base bg-red-500 text-white font-bold focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500"
          onClick={() => setRegister(!register)}
        >
          novo cliente
        </button>
      </div>
      {register ? (
        <FormRegister
          sucessAlert="cliente cadastrado com sucesso!"
          errorAlert="cliente não cadastrado!"
          userRole="client"
          token={token}
        />
      ) : (
        <div />
      )}
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
