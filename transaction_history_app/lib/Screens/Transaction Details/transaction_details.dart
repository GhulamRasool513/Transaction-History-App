import 'package:flutter/material.dart';
import 'package:transaction_history_app/Screens/Transaction%20Details/widgets.dart';
import 'package:transaction_history_app/constants.dart';

class TransactionDetails extends StatelessWidget {
  //Constructor to receive data from Transaction History Screen.
  final String type;
  final String amount;
  final String date;
  final String currency;
  final String description;

  TransactionDetails({
    required this.type,
    required this.amount,
    required this.date,
    required this.currency,
    required this.description,
  });

  //Details Screen Starts Here.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kPrimaryBackgroundColor,
      appBar: AppBar(
        title: const Text('Transaction Details'),
        centerTitle: true,
        backgroundColor: kPrimaryBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            //Dollar Sign Container.
            Container(
              height: 150,
              width: 500,
              decoration: BoxDecoration(
                color: type == 'payment' || type == 'withdrawal'
                    ? Color(0xFFFBD5D5)
                    : Color(0xFFBFE9C8),
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              child: Center(
                child: Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                        color: type == 'payment' || type == 'withdrawal'
                            ? Colors.red
                            : Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    child: Icon(
                      Icons.attach_money,
                      size: 45,
                      color: Colors.white70,
                    )),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            //White Body Container
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0))),
                child: Padding(
                    padding: kPadding,
                    child: Details(
                        type: type,
                        amount: amount,
                        date: date,
                        currency: currency,
                        description: description)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
