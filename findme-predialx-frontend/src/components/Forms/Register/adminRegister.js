import React from 'react';

import { useRouter } from 'next/router';

import * as yup from 'yup';

import useForm from '../hooks';

import userService from '../../../services/User';

const registerSchema = yup.object().shape({
  firstName: yup.string().required('O nome é obrigatório'),
  lastName: yup.string().required('O sobrenome é obrigatório'),
  username: yup.string().required('O apelido é obrigatório'),
  email: yup.string().email().required('O e-mail é obrigatório'),
  password: yup.string().min(5).required('A senha é obrigatória'),
});

export default function AdminRegisterForm(
  // eslint-disable-next-line react/prop-types
  sucessAlert, errorAlert,
) {
  const router = useRouter();

  const initialValues = {
    firstName: '',
    lastName: '',
    username: '',
    email: '',
    password: '',
  };

  const form = useForm({
    initialValues,
    onSubmit: (values) => {
      form.setIsFormDisabled(true);

      userService
        .createAdminUser({
          firstName: values.firstName,
          lastName: values.lastName,
          email: values.email,
          username: values.username,
          password: values.password,
        })
        .then(() => {
          console.log(sucessAlert);
          router.push('/login');
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
    <div className="flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8">
      <div className="max-w-lg w-full space-y-8">
        <div>
          <h2 className="mt-6 text-center text-3xl font-bold">
            Insira seus dados
          </h2>
        </div>
        <form className="mt-8 space-y-6" onSubmit={form.handleSubmit}>
          <div className="rounded-md shadow-sm -space-y-px">
            <div>
              {/* eslint-disable-next-line jsx-a11y/label-has-associated-control */}
              <label htmlFor="firstName" className="sr-only">
                seu primeiro nome
              </label>
              <input
                id="firstName"
                name="firstName"
                type="text"
                required
                className="appearance-none rounded relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-red-500 focus:border-red-500 focus:z-10 sm:text-sm"
                placeholder="seu primeiro nome"
                onChange={form.handleChange}
                value={form.values.firstName}
                onBlur={form.handleBlur}
              />
            </div>
            <div>
              {/* eslint-disable-next-line jsx-a11y/label-has-associated-control */}
              <label htmlFor="lastName" className="sr-only">
                seu sobrenome
              </label>
              <input
                id="lastName"
                name="lastName"
                type="text"
                required
                className="appearance-none rounded relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-red-500 focus:border-red-500 focus:z-10 sm:text-sm"
                placeholder="seu sobrenome"
                onChange={form.handleChange}
                value={form.values.lastName}
                onBlur={form.handleBlur}
              />
            </div>
            <div>
              {/* eslint-disable-next-line jsx-a11y/label-has-associated-control */}
              <label htmlFor="email" className="sr-only">
                seu e-mail
              </label>
              <input
                id="email"
                name="email"
                type="email"
                required
                className="appearance-none rounded relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-red-500 focus:border-red-500 focus:z-10 sm:text-sm"
                placeholder="seu e-mail"
                onChange={form.handleChange}
                value={form.values.email}
                onBlur={form.handleBlur}
              />
            </div>
            <div>
              {/* eslint-disable-next-line jsx-a11y/label-has-associated-control */}
              <label htmlFor="username" className="sr-only">
                seu apelido
              </label>
              <input
                id="username"
                name="username"
                type="text"
                required
                className="appearance-none rounded relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-red-500 focus:border-red-500 focus:z-10 sm:text-sm"
                placeholder="seu apelido"
                onChange={form.handleChange}
                value={form.values.username}
                onBlur={form.handleBlur}
              />
            </div>
            <div>
              {/* eslint-disable-next-line jsx-a11y/label-has-associated-control */}
              <label htmlFor="password" className="sr-only">
                sua senha
              </label>
              <input
                id="password"
                name="password"
                type="password"
                required
                className="appearance-none rounded relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-b-md focus:outline-none focus:ring-red-500 focus:border-red-500 focus:z-10 sm:text-sm"
                placeholder="sua senha"
                onChange={form.handleChange}
                value={form.values.password}
                onBlur={form.handleBlur}
              />
            </div>
          </div>

          <div>
            <button
              type="submit"
              className="w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-red-500 hover:bg-red-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500"
              disabled={form.isFormDisabled}
            >
              criar usuário
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}
