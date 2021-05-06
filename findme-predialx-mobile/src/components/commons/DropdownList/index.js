import React from 'react';

import ModalSelector from 'react-native-modal-selector';

export const DropdownList = ({ data, initValue, onChange }) => {
  return (
    <ModalSelector
      data={data}
      initValue={initValue}
      onChange={(value) => onChange({ key: value.key, label: value.label })}
      cancelText="cancelar escolha"
      cancelStyle={{
        padding: 10,
        backgroundColor: 'rgba(239, 68, 68, 1)',
      }}
      cancelTextStyle={{
        color: 'white',
        fontWeight: 'bold',
      }}
      optionContainerStyle={{
        backgroundColor: 'white',
      }}
      optionStyle={{
        backgroundColor: 'white',
      }}
      optionTextStyle={{
        color: 'rgba(107, 114, 128, 1)',
        fontWeight: 'bold',
      }}
      selectStyle={{
        borderRadius: 5,

        backgroundColor: 'rgba(229, 231, 235, 0.5)',
      }}
      selectedItemTextStyle={{
        color: 'rgba(229, 231, 235, 1)',
      }}
      initValueTextStyle={{
        fontWeight: 'bold',
        color: 'rgba(107, 114, 128, 1)',
      }}
    />
  );
};
