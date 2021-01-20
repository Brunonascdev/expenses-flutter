import 'package:flutter/material.dart';

import 'package:expenses/components/transaction_user.dart';

void main() {
  return runApp(ExpensesAPP());
}

class ExpensesAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Card(
              child: Text('Gráfico'),
              elevation: 4,
            ),
          ),
          TransactionUser()
        ],
      ),
    );
  }
}
