import 'package:flutter_test/flutter_test.dart';
import 'package:transaction_history_app/Modal/transaction_modal.dart';
import 'package:transaction_history_app/Provider/transaction_provider.dart';

void main() {
  test('Fetching Data From API', () async {
    //Setup
    TransactionProvider provier = TransactionProvider();
    //Do
    List<TransactionModal> transactionsList = await provier.fetchTransactions();
    //Test
    expect(transactionsList.length, isNot(0));
  });
}
