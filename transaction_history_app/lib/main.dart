import 'package:flutter/material.dart';
import 'Screens/transaction_history.dart';
import 'Screens/transaction_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TransactionHistory(),
    );
  }
}
