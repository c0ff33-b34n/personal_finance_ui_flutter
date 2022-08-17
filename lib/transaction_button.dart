import 'package:flutter/material.dart';
import 'package:personal_finance_tracking_ui/colors.dart';

class TransactionButton extends StatelessWidget {
  const TransactionButton(
      {required this.buttonName, required this.icon, Key? key})
      : super(key: key);

  final String buttonName;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: 82.0,
          width: 82.0,
          padding: const EdgeInsets.all(0.0),
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
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
          height: 80.0,
          width: 80.0,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: kBackgroundSecondaryDark,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              icon,
              Text(
                buttonName,
                style: TextStyle(
                    fontFamily: 'GilroyLight',
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
