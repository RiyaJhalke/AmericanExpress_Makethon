import 'package:flutter/material.dart';

void main() {
  runApp(FinancialApp());
}

class FinancialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Financial Overview',
      home: FinancialHomePage(),
    );
  }
}

class FinancialHomePage extends StatefulWidget {
  @override
  _FinancialHomePageState createState() => _FinancialHomePageState();
}

class _FinancialHomePageState extends State<FinancialHomePage> {
  final TextEditingController _incomeController = TextEditingController();
  final TextEditingController _expensesController = TextEditingController();
  double _savings = 0.0;

  void _calculateSavings() {
    final double income = double.parse(_incomeController.text);
    final double expenses = double.parse(_expensesController.text);
    setState(() {
      _savings = income - expenses;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Financial Overview'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _incomeController,
              decoration: InputDecoration(labelText: 'Monthly Income'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: _expensesController,
              decoration: InputDecoration(labelText: 'Monthly Expenses'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateSavings,
              child: Text('Calculate Savings'),
            ),
            SizedBox(height: 20),
            Text('Estimated Savings: $_savings', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
