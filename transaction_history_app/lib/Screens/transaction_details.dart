import 'package:flutter/material.dart';
import 'transaction_history.dart';

class TransactionDetails extends StatefulWidget {
  const TransactionDetails({Key? key}) : super(key: key);

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
            //Upper White Container Body,
            Container(
              height: 150,
              width: 500,
              decoration: BoxDecoration(
                color: Color(0xFFBFE9C8),
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              //Dollar Sign Container
              child: Center(
                child: Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                        color: Colors.green,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'Deposit Details',
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
                            Text('Amount: ',style: TextStyle(fontSize: 20,),),
                            Text('+\$2889: ',style: TextStyle(fontSize: 18,color: Colors.green),),
                          ],
                        ),
                        Divider(thickness: 1,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Amount: ',style: TextStyle(fontSize: 20,),),
                            Text('05/05/2023',style: TextStyle(fontSize: 18,)),
                          ],
                        ),
                        Divider(thickness: 1,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Currency: ',style: TextStyle(fontSize: 20,),),
                            Text('BDT',style: TextStyle(fontSize: 18,)),
                          ],
                        ),
                        Divider(thickness: 1,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Description: ',style: TextStyle(fontSize: 20,),),
                            Text('invoice transaction at Block, Skiles and Herman using card ending with ***(...4033) for HTG 161.74 in account ***20234535: ',style: TextStyle(fontSize: 15,),),
                            Divider(thickness: 1,),


                          ],
                        ),

                      ],
                    ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
