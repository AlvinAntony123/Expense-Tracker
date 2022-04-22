import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransactions extends StatefulWidget {
  final Function addTx;

  NewTransactions(this.addTx);

  @override
  State<NewTransactions> createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  String textInput, amountInput;
  DateTime selectedDate;

  void dataSubmission() {
    if (textInput == Null || double.parse(amountInput) <= 0) return;

    widget.addTx(
      textInput,
      double.parse(amountInput),
      selectedDate,
    );

    Navigator.of(context).pop();
  }

  void datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                label: Text('Title'),
              ),
              onChanged: (value) => textInput = value,
              onSubmitted: (_) => dataSubmission(),
            ),
            TextField(
              decoration: InputDecoration(
                label: Text('Amount'),
              ),
              onChanged: (value) => amountInput = value,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => dataSubmission(),
            ),
            Container(
              height: 90,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      selectedDate == null
                          ? 'No Date Chosen'
                          : 'Picked Date: ${DateFormat.yMd().format(selectedDate)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: datePicker,
                    child: Text(
                      'Choose A Date',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                  )
                ],
              ),
            ),
            RaisedButton(
              child: Text(
                'Submit',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: dataSubmission,
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
