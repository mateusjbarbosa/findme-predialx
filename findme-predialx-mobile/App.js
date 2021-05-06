import React from 'react';

import {
  Keyboard,
  Pressable,
  ScrollView,
  StyleSheet,
  View,
} from 'react-native';

import Header from './src/components/Header';
import ServiceOrderFormRegister from './src/components/Form/Register/ServiceOrder';

export default function App() {
  return (
    <Pressable
      onPress={() => {
        Keyboard.dismiss();
      }}
    >
      <View style={styles.header}>
        <Header />
      </View>
      <ScrollView style={styles.box}>
        <ServiceOrderFormRegister />
      </ScrollView>
    </Pressable>
  );
}

const styles = StyleSheet.create({
  header: {
    height: '15%',
  },
  box: {
    height: '85%',
    paddingHorizontal: 15,
    paddingVertical: 10,
  },
});
