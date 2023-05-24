import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:transaction_history_app/Screens/transaction_details.dart';
import 'package:transaction_history_app/Global Widgets/constants.dart';
import '../Global Widgets/global_widgets.dart';


class TransactionHistory extends StatefulWidget {
  const TransactionHistory({super.key});

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {

  //API items List
  List<MyCard> transactionList = [];

  //List that is used to show items on screen
  List<MyCard> foundItems = [];

  //Receiving data from API.
  void getData() async {
    //Passing API URL to receive data.
    http.Response response = await http.get(Uri.parse(url));

    //converting API Json data to local variable data.
    var apiData = jsonDecode(response.body);

    //Creating List of items received from API.
    for (var data in apiData) {
      String date =  data['date'];
      String amount =  data['amount'];
      String type = data['type'];
      String currency = data['currency'];
      String description = data['description'];
      String id = data['id'];

      //Adding items to the List.
      transactionList.add(MyCard(
        date: date,
        amount: amount,
        type: type,
        currency: currency,
        description: description,
        id: id,

        //Navigating Data to the Transaction Details Screen.
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransactionDetails(type: type, amount: amount, date: date, currency: currency, description: description);
          }));}
      ));

    }

    //Maintaining changes on the Screen.
    setState(() {});
  }

  @override
  void initState() {
    //calling this method to receive data from API.
    getData();

    //setting the List to show items on Screen.
    foundItems = transactionList;

    super.initState();
  }

  //Implenting Search Functionality.
  void runFilter(String enteredKeyword){

    //Creating List For Searched Items.
    List<MyCard> searchResult = [];

    if(enteredKeyword.isEmpty){
      searchResult = transactionList;

    }else{
      //Items can be searched using id given to every item in the List.
      searchResult = transactionList.where((element) => element.id!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();

    }
    //Showing searched items on the Screen
    setState(() => foundItems = searchResult);
  }

  //The Screen Starts Here.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Transaction History'),
        centerTitle: true,
        backgroundColor:scaffoldBackgroundColor,
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
                decoration: whiteContainerDecoration,
                child: Padding(
                    padding: const EdgeInsets.all(25),
                    //Populating the screen with Transaction items.
                    child: foundItems.isNotEmpty
                        ? ListView(children: foundItems)
                        : LoadingScreen(),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

