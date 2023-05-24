import 'package:flutter/material.dart';
import 'package:transaction_history_app/Global%20Widgets/global_widgets.dart';
import 'package:transaction_history_app/Modal/transaction_modal.dart';
import 'package:transaction_history_app/Provider/transaction_provider.dart';
import 'package:transaction_history_app/Screens/Transaction%20Details/transaction_details.dart';
import 'package:transaction_history_app/Screens/Transaction%20History/widgets.dart';
import 'package:transaction_history_app/constants.dart';
import 'package:intl/intl.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({super.key});

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {

  var isDataLoading = true;


  //Transaction Provider Object.
  TransactionProvider transactionServiceProvider = TransactionProvider();

  //API Data List.
  List<TransactionModal> transactionsList = [];

  //List To Show Items On The Screen.
  List<TransactionModal> foundItems = [];

  //Receiving data from API.
  void getData() async {

    transactionsList = await transactionServiceProvider.fetchTransactions();

    isDataLoading = false;
    //Maintaining changes on the Screen.
    setState(() {
      foundItems = transactionsList;
    });
  }

  @override
  void initState() {
    //calling this method to receive data from API.
    getData();
    super.initState();
  }

  //Implenting Search Functionality.
  void runFilter(String enteredKeyword){

    //Creating List For Searched Items.
    List<TransactionModal> searchResult = [];

    if(enteredKeyword.isEmpty){
      setState(() {
        searchResult = transactionsList;
      });

    }else{
      //Items can be searched by using specific id given to every item in the List.
      searchResult = transactionsList.where((element) => element.amount!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }
    //Showing searched items on the Screen
    setState(() => foundItems = searchResult);
  }
  //The Screen Starts Here.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryBackgroundColor,
      appBar: AppBar(
        title: const Text('Transaction History'),
        centerTitle: true,
        backgroundColor:kPrimaryBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            //Search bar to search through Transaction list.
            MyTextField(
              onChanged: (value){
                runFilter(value);
              },
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
                    padding: const EdgeInsets.all(25),
                    //Populating the screen with Transaction items.
                    child: isDataLoading ? LoadingCircle():foundItems.isNotEmpty
                        ? ListView.builder(
                        itemCount: foundItems.length,
                        itemBuilder: (context, index){

                          TransactionModal transaction = foundItems[index];

                          final f = DateFormat('dd-MMM-yyyy');

                          return MyCard(
                              date: f.format(transaction.date),
                              amount: transaction.amount,
                              type: transaction.type,
                              onTap: () {

                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return TransactionDetails(
                                    date: f.format(transaction.date),
                                    amount: transaction.amount,
                                    type: transaction.type,
                                    currency: transaction.currency,
                                    description: transaction.description,);
                                }));}
                          );

                    })
                        : Center(child: Text('No Data Found',style: TextStyle(fontSize: 20),),),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

