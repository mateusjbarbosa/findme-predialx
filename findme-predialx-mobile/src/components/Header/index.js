import React from 'react';

import { StyleSheet, View } from 'react-native';
import { Title } from '../commons/Title';

export default function Header() {
  return (
    <View style={styles.header}>
      <Title variant="h1">findme • predialx</Title>
    </View>
  );
}

const styles = StyleSheet.create({
  header: {
    flex: 1,
    justifyContent: 'center',

    paddingTop: 50,
    paddingHorizontal: 15,

    backgroundColor: 'rgba(239, 68, 68, 1)',
  },
});
