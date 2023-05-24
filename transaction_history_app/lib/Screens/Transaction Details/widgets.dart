import 'package:flutter/material.dart';

import '../../constants.dart';

//Class Of Details Of Details Screen
class Details extends StatelessWidget {
  final String type;
  final String amount;
  final String date;
  final String currency;
  final String description;

  Details({
    required this.type,
    required this.amount,
    required this.date,
    required this.currency,
    required this.description,
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
            const Text('Amount: ', style: TextStyle(fontSize: 20,),),
            Text(type == 'payment' || type == 'withdrawal'? '-$kCurrency' + '$amount': '+$kCurrency' + '$amount',
              style: TextStyle(fontSize: 18, color: type == 'payment' || type == 'withdrawal'?  Colors.red:Colors.green),),
          ],
        ),
        Divider(thickness: 1,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Date', style: TextStyle(fontSize: 20,),),
            Text(date!.length > 15 ? date!.substring(0, 15) : date!, style: const TextStyle(fontSize: 18,)),
          ],
        ),
        const Divider(thickness: 1,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Currency: ', style: const TextStyle(fontSize: 20,),),
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
