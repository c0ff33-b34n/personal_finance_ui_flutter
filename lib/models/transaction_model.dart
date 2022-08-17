import 'package:flutter/material.dart';

class Transaction {
  const Transaction(
      {required this.assetImage,
      required this.thirdPartyName,
      required this.transactionDate,
      required this.paymentAmount,
      required this.paymentReceived});

  final ImageProvider assetImage;
  final String thirdPartyName;
  final String transactionDate;
  final double paymentAmount;
  final bool paymentReceived;
}
