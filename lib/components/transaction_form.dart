import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionForm({this.onSubmit});

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Theme(
          data: new ThemeData(
            primaryColor: Theme.of(context).primaryColor,
            primaryColorDark: Theme.of(context).primaryColor,
          ),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                onSubmitted: (_) => _submitForm(),
                cursorColor: Theme.of(context).primaryColor,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.text_fields),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  labelText: 'Título',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: valueController,
                  onSubmitted: (_) => _submitForm(),
                  style: TextStyle(fontSize: 18),
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.money),
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    labelText: 'Valor (R\$)',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Theme.of(context).primaryColor,
                        textStyle: TextStyle(
                          fontSize: 18,
                        )),
                    child: Text('Nova Transação'),
                    onPressed: _submitForm,
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
