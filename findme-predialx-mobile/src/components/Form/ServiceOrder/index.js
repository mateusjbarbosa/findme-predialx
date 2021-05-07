import React, { useEffect, useState } from 'react';

import { StyleSheet, Text, View } from 'react-native';

import { Button } from '../../commons/Button';
import { Title } from '../../commons/Title';
import { TextInput } from '../../commons/TextInput';
import { DropdownList } from '../../commons/DropdownList';

import { userService } from '../../../services/User';
import { serviceOrderService } from '../../../services/ServiceOrder';

const Form = ({ token, contributorEmail }) => {
  const [date, setDate] = useState(
    new Date(Date.now()).toLocaleDateString('pt-BR')
  );
  const [clients, setClients] = useState([]);
  const [selectedClient, setSelectedClient] = useState(null);
  const [serviceOrderDescription, setServiceOrderDescription] = useState('');

  const [isLoading, setLoading] = useState(true);

  useEffect(() => {
    const clientsList = [];

    userService
      .getClients(token)
      .then((data) => {
        data.forEach((client) => {
          const parsedUser = {
            key: client.id,
            label: `${client.first_name} ${client.last_name}`,
          };

          clientsList.push(parsedUser);
        });

        setClients(clientsList);
      })
      .catch((err) => console.log('err', err))
      .finally(() => setLoading(false));
  }, []);

  return (
    <View>
      {isLoading ? (
        <Text style={styles.loading}>Carregando...</Text>
      ) : (
        <View>
          <View style={styles.field}>
            <Title variant="h3">data de abertura</Title>
            <TextInput variant="small" onChangeText={setDate} value={date} />
          </View>

          <View style={styles.field}>
            <Title variant="h3">cliente atendido</Title>
            <DropdownList
              data={clients}
              initValue={
                selectedClient ? selectedClient.label : 'selecione um cliente'
              }
              onChange={setSelectedClient}
            />
          </View>

          <View style={styles.field}>
            <Title variant="h3">descrição do problema</Title>
            <TextInput
              variant="large"
              onChangeText={setServiceOrderDescription}
              value={serviceOrderDescription}
              placeholder="Detalhe o problema relatado para abertura dessa ordem"
              isMultiline={true}
            />
          </View>

          <View style={styles.field}>
            <Button
              title="abrir ordem"
              onPress={async () => {
                setLoading(true);
                const [{ id }] = await userService.getContributorByEmail(
                  token,
                  contributorEmail
                );

                await serviceOrderService.sendServiceOrder(token, {
                  date,
                  clientId: selectedClient.key,
                  contributorId: id,
                  description: serviceOrderDescription,
                });

                setLoading(false);

                setSelectedClient(null);
                setServiceOrderDescription(null);
              }}
            />
          </View>
        </View>
      )}
    </View>
  );
};

export default function ServiceOrderFormRegister({ token, contributorEmail }) {
  return (
    <View>
      <Title variant="h2">cadastrar nova ordem de serviço</Title>
      <Form token={token} contributorEmail={contributorEmail} />
    </View>
  );
}

const styles = StyleSheet.create({
  field: {
    marginTop: 15,
  },
  loading: {
    marginTop: 20,
    fontSize: 20,
    fontWeight: 'bold',
    color: 'rgba(107, 114, 128, 0.5)',
  },
});
