import 'package:flutter/material.dart';

import 'transaction_model.dart';

class TransactionsRepository {
  static List<Transaction> loadTransactions() {
    const transactions = <Transaction>[
      Transaction(
          assetImage: AssetImage('assets/app_store_logo_sm.png'),
          thirdPartyName: 'App Store',
          transactionDate: 'May 22 5:45 AM',
          paymentAmount: 25.0,
          paymentReceived: false),
      Transaction(
          assetImage: AssetImage('assets/bloke.jpg'),
          thirdPartyName: 'Daniel',
          transactionDate: 'May 24 6:45 PM',
          paymentAmount: 100.0,
          paymentReceived: true),
      Transaction(
          assetImage: AssetImage('assets/woman.jpg'),
          thirdPartyName: 'Tamara',
          transactionDate: 'May 25 10:15 PM',
          paymentAmount: 125.0,
          paymentReceived: true),
    ];

    return transactions;
  }
}
