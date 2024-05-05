import React, { useState } from 'react';
import { View, Text, TextInput, Button, StyleSheet } from 'react-native';

const App = () => {
  const [income, setIncome] = useState('');
  const [expenses, setExpenses] = useState('');
  const [savings, setSavings] = useState('');

  const calculateSavings = () => {
    const totalSavings = parseFloat(income) - parseFloat(expenses);
    setSavings(totalSavings.toString());
  };

  return (
    <View style={styles.container}>
      <Text style={styles.header}>Financial Overview</Text>
      
      <TextInput
        style={styles.input}
        placeholder="Enter your monthly income"
        keyboardType="numeric"
        value={income}
        onChangeText={setIncome}
      />
      
      <TextInput
        style={styles.input}
        placeholder="Enter your monthly expenses"
        keyboardType="numeric"
        value={expenses}
        onChangeText={setExpenses}
      />
      
      <Button title="Calculate Savings" onPress={calculateSavings} />
      
      <Text style={styles.result}>Estimated Savings: {savings}</Text>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 24,
    backgroundColor: '#fff',
  },
  header: {
    fontSize: 24,
    marginBottom: 16,
    textAlign: 'center',
  },
  input: {
    height: 48,
    marginBottom: 16,
    borderWidth: 1,
    padding: 10,
  },
  result: {
    fontSize: 18,
    marginTop: 20,
    textAlign: 'center',
  },
});

export default App;
