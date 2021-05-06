import React from 'react';

import { StyleSheet, Text, TouchableOpacity } from 'react-native';

export const Button = ({ title, onPress }) => {
  return (
    <TouchableOpacity style={styles.button} onPress={onPress}>
      <Text style={styles.buttonText}>{title}</Text>
    </TouchableOpacity>
  );
};

const styles = StyleSheet.create({
  button: {
    flex: 1,
    alignItems: 'center',

    padding: 10,

    borderRadius: 10,

    backgroundColor: 'rgba(239, 68, 68, 1)',
  },
  buttonText: {
    fontSize: 20,
    fontWeight: 'bold',
    color: 'white',
  },
});
