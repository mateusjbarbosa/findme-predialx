import React from 'react';

import { Keyboard, Pressable, ScrollView, StyleSheet } from 'react-native';

import 'react-native-gesture-handler';

import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';

import LoginForm from './src/components/Form/Login';
import ServiceOrderFormRegister from './src/components/Form/ServiceOrder';

const LoginScreen = ({ navigation }) => {
  return (
    <Pressable
      onPress={() => {
        Keyboard.dismiss();
      }}
    >
      <ScrollView style={styles.box}>
        <LoginForm navigation={navigation} />
      </ScrollView>
    </Pressable>
  );
};

const ServiceOrderFormScreen = ({ route }) => {
  const { token, email } = route.params;

  return (
    <Pressable
      onPress={() => {
        Keyboard.dismiss();
      }}
    >
      <ScrollView style={styles.box}>
        <ServiceOrderFormRegister token={token} contributorEmail={email} />
      </ScrollView>
    </Pressable>
  );
};

export default function App() {
  const Stack = createStackNavigator();

  return (
    <NavigationContainer>
      <Stack.Navigator initialRouteName="LoginScreen">
        <Stack.Screen
          name="LoginScreen"
          component={LoginScreen}
          options={{
            title: 'findme • predialx',
            headerStyle: {
              backgroundColor: 'rgba(239, 68, 68, 1)',
            },
            headerTintColor: 'white',
            headerTitleStyle: {
              fontWeight: 'bold',
            },
          }}
        />
        <Stack.Screen
          name="ServiceOrderFormScreen"
          component={ServiceOrderFormScreen}
          options={{
            title: 'findme • predialx',
            headerStyle: {
              backgroundColor: 'rgba(239, 68, 68, 1)',
            },
            headerTintColor: 'white',
            headerTitleStyle: {
              fontWeight: 'bold',
            },
          }}
        />
      </Stack.Navigator>
    </NavigationContainer>
  );
}

const styles = StyleSheet.create({
  box: {
    height: '100%',
    paddingHorizontal: 15,
    paddingVertical: 10,
  },
});
