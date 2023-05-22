import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({super.key});

  final text = '2023-04-15T05:57:47.157Z"';

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
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Transparent Red Container
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Color(0xFFFBD5D5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            //Dollar Sign Container
                            child: Center(
                              child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0))),
                                  child: Icon(
                                    Icons.attach_money,
                                    size: 25,
                                    color: Colors.white70,
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Payment',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                text.length > 10
                                    ? '${text.substring(0, 10)}'
                                    : text,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black38,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 150,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '-\$281.28',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.red.shade500,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.arrow_circle_up,
                                color: Colors.red,
                              )
                            ],
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Transparent Red Container
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Color(0xFFD4F0DA),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            //Dollar Sign Container
                            child: Center(
                              child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF29B446),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0))),
                                  child: Icon(
                                    Icons.attach_money,
                                    size: 25,
                                    color: Colors.white70,
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Deposit',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                text.length > 10
                                    ? '${text.substring(0, 10)}'
                                    : text,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black38,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 150,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '409.51"',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Color(0xFF29B446),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.arrow_circle_down,
                                color: Colors.green,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Transparent Red Container
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Color(0xFFFBD5D5),
                              borderRadius:
                              BorderRadius.all(Radius.circular(15)),
                            ),
                            //Dollar Sign Container
                            child: Center(
                              child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0))),
                                  child: Icon(
                                    Icons.attach_money,
                                    size: 25,
                                    color: Colors.white70,
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Payment',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                text.length > 10
                                    ? '${text.substring(0, 10)}'
                                    : text,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black38,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 150,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '-\$281.28',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.red.shade500,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.arrow_circle_up,
                                color: Colors.red,
                              )
                            ],
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Transparent Red Container
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Color(0xFFD4F0DA),
                              borderRadius:
                              BorderRadius.all(Radius.circular(15)),
                            ),
                            //Dollar Sign Container
                            child: Center(
                              child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF29B446),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0))),
                                  child: Icon(
                                    Icons.attach_money,
                                    size: 25,
                                    color: Colors.white70,
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Deposit',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                text.length > 10
                                    ? '${text.substring(0, 10)}'
                                    : text,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black38,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 150,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '409.51"',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Color(0xFF29B446),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.arrow_circle_down,
                                color: Colors.green,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
