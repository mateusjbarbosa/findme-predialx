import React from 'react';

import { StyleSheet, TextInput as Input } from 'react-native';

export const TextInput = ({
  variant,
  onChangeText,
  value,
  placeholder,
  isMultiline,
}) => {
  return (
    <Input
      style={styles[variant]}
      onChangeText={onChangeText}
      value={value}
      placeholder={placeholder}
      multiline={isMultiline}
    />
  );
};

const styles = StyleSheet.create({
  small: {
    fontSize: 16,

    paddingVertical: 5,
    paddingHorizontal: 10,

    height: 50,

    borderRadius: 5,

    backgroundColor: 'rgba(229, 231, 235, 0.5)',
  },

  large: {
    fontSize: 16,

    paddingVertical: 5,
    paddingHorizontal: 10,

    height: 150,

    borderRadius: 5,

    backgroundColor: 'rgba(229, 231, 235, 0.5)',
  },
});
