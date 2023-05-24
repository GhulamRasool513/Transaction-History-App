import 'package:flutter/material.dart';

// To parse this JSON data, do
//
//     final transactionModal = transactionModalFromJson(jsonString);

import 'dart:convert';

List<TransactionModal> transactionModalFromJson(String str) => List<TransactionModal>.from(json.decode(str).map((x) => TransactionModal.fromJson(x)));

class TransactionModal {
  DateTime date;
  String amount;
  String currency;
  String type;
  String description;
  String id;

  TransactionModal({
    required this.date,
    required this.amount,
    required this.currency,
    required this.type,
    required this.description,
    required this.id,
  });

  factory TransactionModal.fromJson(Map<String, dynamic> json) => TransactionModal(
    date: DateTime.parse(json["date"]),
    amount: json["amount"],
    currency: json["currency"],
    type: json["type"],
    description: json["description"],
    id: json["id"],
  );
}
