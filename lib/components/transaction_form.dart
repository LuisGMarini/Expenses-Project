import 'package:flutter/material.dart';
import 'adaptative_button.dart';
import 'adaptative_test_field.dart';
import 'adaptative_date_picker.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  var _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;
    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value, _selectedDate);
  }



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 250,
          ),
          child: Column(
            children: [
              AdaptativeTextField(
                label: "Título",
                controller: _titleController,
                onSubmitted: (_) => _submitForm(),
                keyboardType: TextInputType.text,
              ),
              AdaptativeTextField(
                label: "Valor (R\$)",
                controller: _valueController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (value) => _submitForm(),
              ),
             AdaptativeDatePicker(
               selectedDate: _selectedDate,
               onDateChanged: (newDate) {
                 setState(() {
                   _selectedDate = newDate;
                 });
               },
             ),
              Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AdaptativeButton(label: "Nova Transação", onPressed: _submitForm),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
