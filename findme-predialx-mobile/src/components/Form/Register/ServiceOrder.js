import React, { useEffect, useState } from 'react';

import { StyleSheet, Text, View } from 'react-native';

import { Button } from '../../commons/Button';
import { Title } from '../../commons/Title';
import { TextInput } from '../../commons/TextInput';
import { DropdownList } from '../../commons/DropdownList';

import { userService } from '../../../services/User';
import { serviceOrderService } from '../../../services/ServiceOrder';

const Form = () => {
  const [date, setDate] = useState(
    new Date(Date.now()).toLocaleDateString('pt-BR')
  );
  const [clients, setClients] = useState([]);
  const [selectedClient, setSelectedClient] = useState(null);
  const [serviceOrderDescription, setServiceOrderDescription] = useState('');

  const [isLoading, setLoading] = useState(true);

  const token =
    'eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJjU0VNRENLRnc4QkFlcERadEd6cWRLMlg1VUJPUURTdUY1NUpuTk94V3lrIn0.eyJleHAiOjE2MjAzNzg2MTgsImlhdCI6MTYyMDM0MjYxOCwianRpIjoiYjA2NWQxMTAtZTA3NS00ZjRlLTg4OWUtNTIwN2E3N2RmMjRlIiwiaXNzIjoiaHR0cDovL2hvc3QuZG9ja2VyLmludGVybmFsOjgwODAvYXV0aC9yZWFsbXMvZmluZG1lLXByZWRpYWx4IiwiYXVkIjpbInJlYWxtLW1hbmFnZW1lbnQiLCJhY2NvdW50Il0sInN1YiI6IjBiNjU1MjE1LTYyYjYtNDU2Ny1hODhjLTQ0Njk4YmQ4OTIxMiIsInR5cCI6IkJlYXJlciIsImF6cCI6ImJhY2tlbmQiLCJzZXNzaW9uX3N0YXRlIjoiNGUwNDRiZjItNzE5NC00OGViLTgyYWEtMThiNTgzODM3MTkzIiwiYWNyIjoiMSIsImFsbG93ZWQtb3JpZ2lucyI6WyJodHRwOi8vbG9jYWxob3N0OjMwMDAiXSwicmVhbG1fYWNjZXNzIjp7InJvbGVzIjpbImFkbWluIl19LCJyZXNvdXJjZV9hY2Nlc3MiOnsicmVhbG0tbWFuYWdlbWVudCI6eyJyb2xlcyI6WyJtYW5hZ2UtcmVhbG0iLCJtYW5hZ2UtdXNlcnMiXX0sImJhY2tlbmQiOnsicm9sZXMiOlsiYWRtaW4iXX0sImFjY291bnQiOnsicm9sZXMiOlsibWFuYWdlLWFjY291bnQiLCJtYW5hZ2UtYWNjb3VudC1saW5rcyIsInZpZXctcHJvZmlsZSJdfX0sInNjb3BlIjoib3BlbmlkIHByb2ZpbGUgZW1haWwiLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwibmFtZSI6IkFkbWluIEZpbmRNZSIsInByZWZlcnJlZF91c2VybmFtZSI6ImFkbWluIiwiZ2l2ZW5fbmFtZSI6IkFkbWluIiwiZmFtaWx5X25hbWUiOiJGaW5kTWUiLCJlbWFpbCI6ImFkbWluQGZpbmRtZS5pZCJ9.jLGxtyET3uZ_lQJ1R8wfMUupaPK42PkXGiSPbBM5hMoPoXwArWkNi4uBtUdBDwfxGvfraM6jcIE4r0H7jUxDMCS6Z3tm3eR6iNqx2MwipPUjNgQYWHijED0PMCuy0zSZme-h9Qo8eZgjBKheS-hpYy9tFjXbolrzWHcYPhJHaVKpciOa2Y_IyRedxq2wD7t0KnhBzW4davzwBaIA368AdQMZ2EEublQ4SriiTfe0-PQFAXlpMLNFC7gNY05DecMRCEFFPSRUv2xGcBAqTyiABFiHyZcNoQB6GB8x_Z_rsHuv_3aeTfYXJllZssIMLgVAbxlNQiQJ1Go7hgeAhUl4LQ';
  const contributorId = '8bc1fedb-d59d-42d5-8461-dd9586de75a9';

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
              onPress={() => {
                serviceOrderService.sendServiceOrder(token, {
                  date,
                  clientId: selectedClient.key,
                  contributorId,
                  description: serviceOrderDescription,
                });
              }}
            />
          </View>
        </View>
      )}
    </View>
  );
};

export default function ServiceOrderFormRegister() {
  return (
    <View>
      <Title variant="h2">cadastrar nova ordem de serviço</Title>
      <Form />
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
