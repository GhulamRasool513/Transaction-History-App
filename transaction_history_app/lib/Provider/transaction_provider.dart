
import 'package:http/http.dart' as http;

import '../Modal/transaction_modal.dart';

class TransactionProvider {
  //API URL
  String kTransactionPath =
      'https://64677d7f2ea3cae8dc3091e7.mockapi.io/api/v1/transactions';

  fetchTransactions() async {
//Passing API URL to receive data.
    http.Response response = await http.get(Uri.parse(kTransactionPath));

    //converting API Json data to local variable data.
    if (response.statusCode == 200) {
      return transactionModalFromJson(response.body);
    } else {
      print('Failed To Fetch Data From API');
      return [];
    }
  }
}
