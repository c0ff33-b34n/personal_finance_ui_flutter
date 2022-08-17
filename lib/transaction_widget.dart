import 'package:flutter/material.dart';
import 'package:personal_finance_tracking_ui/colors.dart';

class TransactionWidget extends StatelessWidget {
  const TransactionWidget(
      {required this.assetImage,
      required this.thirdPartyName,
      required this.transactionDate,
      required this.paymentAmount,
      required this.paymentReceived,
      Key? key})
      : super(key: key);

  final ImageProvider assetImage;
  final String thirdPartyName;
  final String transactionDate;
  final double paymentAmount;
  final bool paymentReceived;

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
                          backgroundImage: assetImage,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(thirdPartyName),
                          Text(
                            transactionDate,
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
                child: paymentReceived == true
                    ? Text(
                        '+ \$ ' + paymentAmount.toStringAsFixed(2),
                        style: TextStyle(color: kTextGreen),
                      )
                    : Text(
                        '- \$ ' + paymentAmount.toStringAsFixed(2),
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
