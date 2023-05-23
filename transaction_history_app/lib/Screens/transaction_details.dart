import 'package:flutter/material.dart';
import 'transaction_history.dart';

class TransactionDetails extends StatefulWidget {
  String? type;
  String? amount;
  String? date;
  String? currency;
  String? description;
  String? id;

  TransactionDetails({
    required this.type,
    required this.amount,
    required this.date,
    required this.currency,
    required this.description,
    this.id
  });
  @override
  State<TransactionDetails> createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff418DE5),
      appBar: AppBar(
        title: const Text('Transaction Details'),
        centerTitle: true,
        backgroundColor: const Color(0xff418DE5),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 150,
              width: 500,
              decoration: BoxDecoration(
                color: widget.type == 'payment' ? Color(0xFFFBD5D5) : Color(0xFFBFE9C8),
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              //Dollar Sign Container
              child: Center(
                child: Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                        color: widget.type == 'payment' ? Colors.red : Colors.green,
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
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0))),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 25.0, left: 20, right: 25, bottom: 25),
                  child: Details(type: widget.type, amount: widget.amount, date: widget.date, currency: widget.currency, description: widget.description)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Details extends StatelessWidget {
  String? type;
  String? amount;
  String? date;
  String? currency;
  String? description;
  String? id;

  Details({
    required this.type,
    required this.amount,
    required this.date,
    required this.currency,
    required this.description,
    this.id
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            '$type details',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 25.0,
            ),
          ),
        ),
        Divider(thickness: 1,),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Amount: ', style: TextStyle(fontSize: 20,),),
            Text(type == 'payment'? '-\$$amount': '+\$$amount',
              style: TextStyle(fontSize: 18, color: type == 'payment'?  Colors.red:Colors.green),),
          ],
        ),
        Divider(thickness: 1,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Date', style: TextStyle(fontSize: 20,),),
            Text(date!.length > 10 ? date!.substring(0, 10) : date!, style: TextStyle(fontSize: 18,)),
          ],
        ),
        Divider(thickness: 1,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Currency: ', style: TextStyle(fontSize: 20,),),
            Text('$currency', style: TextStyle(fontSize: 18,)),
          ],
        ),
        Divider(thickness: 1,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Description: ', style: TextStyle(fontSize: 20,),),
            Text(
              '$description',
              style: TextStyle(fontSize: 15,),),
            Divider(thickness: 1,),
          ],
        ),

      ],
    );
  }
}
