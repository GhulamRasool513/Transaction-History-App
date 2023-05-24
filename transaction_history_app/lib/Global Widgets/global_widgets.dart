import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:transaction_history_app/Global%20Widgets/constants.dart';

//API URL
String url =
    'https://64677d7f2ea3cae8dc3091e7.mockapi.io/api/v1/transactions';

//Search bar for Transaction History Screen.
class MyTextField extends StatelessWidget {

  final Function(String val) onChanged;

  const MyTextField({required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        onChanged: onChanged,
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(20.0),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.white),
            fillColor: Color(0xff93B7E5),
            filled: true),
      ),
    );
  }
}

//Loading Circle
class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SpinKitCircle(
      duration: Duration(seconds: 2),
      size: 70.0,
      color: Color(0xFF0ED679),
    );
  }
}

//Decoration Of Items Of Screen
class MyCard extends StatelessWidget {
  final String? date;
  final String? amount;
  final String? currency;
  final String? type;
  final String? description;
  final String? id;
  final Function()? onTap;

  MyCard(
      {required this.date,
        required this.amount,
        this.currency,
        required this.type,
        this.description,
        this.id,
        this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Making items of the screen Clickable.
        GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              //Transparent Red Container
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color:
                  type == 'payment' || type == 'withdrawal' ? const Color(0xFFFBD5D5) : const Color(0xFFBFE9C8),
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),

                //Dollar Sign Container
                child: Center(
                  child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          color: type == 'payment' || type == 'withdrawal' ? Colors.red : Colors.green,
                          borderRadius:
                          BorderRadius.all(const Radius.circular(30.0))),
                      child: Icon(
                        Icons.attach_money,
                        size: 25,
                        color: Colors.white70,
                      )),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$type',
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    date!.length > 10 ? date!.substring(0, 10) : date!,
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.black38,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    type == 'payment' || type == 'withdrawal' ? '-\$$amount' : '+\$$amount',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: type == 'payment' || type == 'withdrawal'
                          ? Colors.red.shade500
                          : Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text('id-$id',style: const TextStyle( color: Colors.black38,),),
                      const SizedBox(
                        width: 7,
                      ),
                      Icon(
                        type == 'payment' || type == 'withdrawal'
                            ? Icons.arrow_circle_up
                            : Icons.arrow_circle_down,
                        color: type == 'payment' || type == 'withdrawal' ? Colors.red : Colors.green,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        dividerLine
      ],
    );
  }
}

//Class Of Details Of Details Screen
class Details extends StatelessWidget {
  final String? type;
  final String? amount;
  final String? date;
  final String? currency;
  final String? description;
  final String? id;

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
        dividerLine,
         SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Amount: ', style: TextStyle(fontSize: 20,),),
            Text(type == 'payment' || type == 'withdrawal'? '-\$$amount': '+\$$amount',
              style: TextStyle(fontSize: 18, color: type == 'payment' || type == 'withdrawal'?  Colors.red:Colors.green),),
          ],
        ),
        dividerLine,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Date', style: TextStyle(fontSize: 20,),),
            Text(date!.length > 10 ? date!.substring(0, 10) : date!, style: const TextStyle(fontSize: 18,)),
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



