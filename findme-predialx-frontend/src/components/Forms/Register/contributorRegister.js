import React from 'react';

import * as yup from 'yup';

import Button from '../../commons/Button';
import Input from '../../commons/Input';

import useForm from '../hooks';

import userService from '../../../services/User';

const registerSchema = yup.object().shape({
  firstName: yup.string().required('O nome é obrigatório'),
  lastName: yup.string().required('O sobrenome é obrigatório'),
  email: yup.string().email().required('O e-mail é obrigatório'),
  password: yup.string().min(5).required('A senha é obrigatória'),
});

export default function FormContributorRegister({
  // eslint-disable-next-line react/prop-types
  sucessAlert, errorAlert, userRole, token,
}) {
  const initialValues = {
    firstName: '',
    lastName: '',
    email: '',
    password: '',
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
          username: `${values.firstName
            .replace(/ +/g, '')
            .toLowerCase()}${values.lastName.replace(/ +/g, '')}`,
          role: userRole,
          password: values.password,
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
        cadastrar novo colaborador
      </h3>
      <form
        className="flex bg-gray-100 py-4 px-4 rounded-lg"
        onSubmit={form.handleSubmit}
      >
        <div className="pr-8 w-1/4">
          <Input
            label="nome"
            id="firstName"
            type="text"
            placeholder="ex.: João"
            onChange={form.handleChange}
            value={form.values.firstName}
            onBlur={form.handleBlur}
          />
        </div>
        <div className="pr-8 w-1/4">
          <Input
            label="sobrenome"
            id="lastName"
            type="text"
            placeholder="ex.: Silva"
            onChange={form.handleChange}
            value={form.values.lastName}
            onBlur={form.handleBlur}
          />
        </div>
        <div className="pr-8 w-1/4">
          <Input
            label="e-mail do colaborador"
            id="email"
            type="email"
            placeholder="ex.: joaosilva@findme.id"
            onChange={form.handleChange}
            value={form.values.email}
            onBlur={form.handleBlur}
          />
        </div>
        <div className="pr-8 w-1/4">
          <Input
            label="senha do colaborador"
            id="password"
            type="password"
            placeholder="mínimo: 5 caracteres"
            onChange={form.handleChange}
            value={form.values.password}
            onBlur={form.handleBlur}
          />
        </div>
        <div className="flex items-end py-0.5">
          <Button type="submit" variant="primary" customStyle="mr-4">
            adicionar
          </Button>
        </div>
      </form>
    </div>
  );
}
