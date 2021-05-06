import React from 'react';

import { StyleSheet, Text } from 'react-native';

export const Title = ({ variant, children }) => {
  return <Text style={styles[variant]}>{children}</Text>;
};

const styles = StyleSheet.create({
  h1: {
    fontSize: 25,
    fontWeight: 'bold',
    color: 'white',
  },
  h2: {
    fontSize: 20,
    fontWeight: 'bold',
    color: 'rgba(239, 68, 68, 1)',
  },
  h3: {
    fontSize: 15,
    fontWeight: 'bold',
    color: 'rgba(107, 114, 128, 1)',
  },
});
