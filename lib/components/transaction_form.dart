import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit;

  TransactionForm({this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Theme(
          data: new ThemeData(
            primaryColor: Colors.pink,
            primaryColorDark: Colors.pink,
          ),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                cursorColor: Colors.pink,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.text_fields),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                  labelText: 'Título',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextField(
                  controller: valueController,
                  style: TextStyle(fontSize: 18),
                  cursorColor: Colors.pink,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.money),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                    ),
                    labelText: 'Valor (R\$)',
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.pink,
                    ),
                    child: Text('Nova Transação'),
                    onPressed: () {
                      final title = titleController.text;
                      final value =
                          double.tryParse(valueController.text) ?? 0.0;

                      onSubmit(title, value);
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
