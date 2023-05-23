import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({super.key});

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  List<MyCard> cardList = [];

  void getData() async {
    String url =
        'https://64677d7f2ea3cae8dc3091e7.mockapi.io/api/v1/transactions';
    http.Response response = await http.get(Uri.parse(url));
    var apiData = jsonDecode(response.body);
    print(apiData.length);

    for (var data in apiData) {
      String date = await data['date'];
      String amount = await data['amount'];
      String type = await data['type'];

      cardList.add(MyCard(
        date: date,
        amount: amount,
        type: type,
        currency: 'currency',
        description: 'des',
        id: 'id',
        onTap: (){},
      ));
    }
    setState(() {
      print('object');
    });
  }

  @override
  void initState() {
    print('Init State');
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff418DE5),
      appBar: AppBar(
        title: const Text('Transaction History'),
        centerTitle: true,
        backgroundColor: const Color(0xff418DE5),
      ),
      body: SafeArea(
        child: Column(
          children: [
            //Search Bar.
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                onTap: () {
                  setState(() {
                    print('tapped');
                  });
                },
                decoration: InputDecoration(
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
            ),
            //Upper White Container Body
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
                    child: cardList.isNotEmpty
                        ? ListView(children: cardList)
                        : Text('data Is Loading')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final name = '2023-04-15T05:57:47.157Z"';

class MyCard extends StatelessWidget {
  String? date;
  String? amount;
  String? currency;
  String? type;
  String? description;
  String? id;
  Function()? onTap;

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
                      type == 'payment' ? Color(0xFFFBD5D5) : Color(0xFFBFE9C8),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                //Dollar Sign Container
                child: Center(
                  child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          color: type == 'payment' ? Colors.red : Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(30.0))),
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
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    date!.length > 10 ? date!.substring(0, 10) : date!,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black38,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    type == 'payment' ? '-\$$amount': '+\$$amount',
                    style: TextStyle(
                      fontSize: 15.0,
                      color:
                          type == 'payment' ? Colors.red.shade500 : Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    type == 'payment'
                        ? Icons.arrow_circle_up
                        : Icons.arrow_circle_down,
                    color: type == 'payment' ? Colors.red : Colors.green,
                  )
                ],
              ),
            ],
          ),
        ),
        Divider()
      ],
    );
  }
}
