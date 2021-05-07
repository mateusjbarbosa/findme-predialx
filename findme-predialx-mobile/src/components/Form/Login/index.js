import React, { useState } from 'react';

import { StyleSheet, View } from 'react-native';

import { Button } from '../../commons/Button';
import { Title } from '../../commons/Title';
import { TextInput } from '../../commons/TextInput';

import { authService } from '../../../services/Auth';

const Form = ({ navigation }) => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');

  return (
    <View>
      <View style={styles.field}>
        <Title variant="h3">apelido</Title>
        <TextInput
          variant="small"
          onChangeText={setUsername}
          value={username}
          placeholder="ex.: joaosilva"
        />
      </View>

      <View style={styles.field}>
        <Title variant="h3">senha</Title>
        <TextInput
          variant="small"
          onChangeText={setPassword}
          value={password}
          placeholder="não divulgue sua senha"
        />
      </View>

      <View style={styles.field}>
        <Button
          title="acessar área restrita"
          onPress={async () => {
            const [token, email] = await authService.login({
              username,
              password,
            });
            navigation.navigate('ServiceOrderFormScreen', {
              token,
              email,
            });
          }}
        />
      </View>
    </View>
  );
};

export default function LoginForm({ navigation }) {
  return (
    <View>
      <Title variant="h2">insira suas credenciais</Title>
      <Form navigation={navigation} />
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
