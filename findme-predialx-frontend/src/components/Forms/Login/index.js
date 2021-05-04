import React from 'react';

import { useRouter } from 'next/router';

import * as yup from 'yup';

import useForm from '../hooks';

import loginService from './service';

const loginSchema = yup.object().shape({
  username: yup.string().required('O apelido é obrigatório'),
  password: yup.string().required('A senha é obrigatória'),
});

export default function LoginForm() {
  const router = useRouter();

  const initialValues = {
    username: '',
    password: '',
  };

  const form = useForm({
    initialValues,
    onSubmit: (values) => {
      form.setIsFormDisabled(true);

      loginService
        .login({
          username: values.username,
          password: values.password,
        })
        .then(() => {
          router.push('/');
        })
        .catch((err) => {
          console.error(err);
        })
        .finally(() => {
          form.setIsFormDisabled(false);
        });
    },
    async validateSchema(values) {
      return loginSchema.validate(values, {
        abortEarly: false,
      });
    },
  });

  return (
    <div className="flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8">
      <div className="max-w-lg w-full space-y-8">
        <div>
          <h2 className="mt-6 text-center text-3xl font-bold">
            Insira suas credenciais de acesso
          </h2>
        </div>
        <form className="mt-8 space-y-6" onSubmit={form.handleSubmit}>
          <div className="rounded-md shadow-sm -space-y-px">
            <div>
              {/* eslint-disable-next-line jsx-a11y/label-has-associated-control */}
              <label htmlFor="username" className="sr-only">
                seu e-mail
              </label>
              <input
                id="username"
                name="username"
                type="text"
                required
                className="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-red-500 focus:border-red-500 focus:z-10 sm:text-sm"
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
                className="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-b-md focus:outline-none focus:ring-red-500 focus:border-red-500 focus:z-10 sm:text-sm"
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
              acessar área restrita
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}
