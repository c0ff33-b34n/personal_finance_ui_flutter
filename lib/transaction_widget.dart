import 'package:flutter/material.dart';
import 'package:personal_finance_tracking_ui/colors.dart';
import 'models/transaction_model.dart';

class TransactionWidget extends StatelessWidget {
  const TransactionWidget({required this.transaction, Key? key})
      : super(key: key);

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: 72.0,
          width: 362.0,
          padding: const EdgeInsets.all(0.0),
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.0),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                kButtonGradientTopDark,
                kButtonGradientBottomDark,
              ],
            ),
          ),
        ),
        Container(
          height: 70.0,
          width: 360.0,
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: kBackgroundSecondaryDark,
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 12.0),
                        child: CircleAvatar(
                          radius: 22.0,
                          backgroundImage: transaction.assetImage,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(transaction.thirdPartyName),
                          Text(
                            transaction.transactionDate,
                            style: TextStyle(
                              fontSize: 13.0,
                              color: kTextColorSecondaryDark,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: transaction.paymentReceived == true
                    ? Text(
                        '+ \$ ' + transaction.paymentAmount.toStringAsFixed(2),
                        style: TextStyle(color: kTextGreen),
                      )
                    : Text(
                        '- \$ ' + transaction.paymentAmount.toStringAsFixed(2),
                        style: TextStyle(color: kTextRed),
                      ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
