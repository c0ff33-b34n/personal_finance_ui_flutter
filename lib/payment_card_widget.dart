import 'package:flutter/material.dart';
import 'models/card_model.dart';
import 'colors.dart';

class PaymentCardWidget extends StatelessWidget {
  const PaymentCardWidget({required this.card, Key? key}) : super(key: key);

  final PaymentCard card;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 214,
      width: 340,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0), color: kGradientPink),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: card.cardType == CardType.Visa
              ? const LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  // Add one stop for each color. Stops should increase from 0 to 1
                  stops: [0.0, 1.0],
                  colors: [
                    // Colors are easy thanks to Flutter's Colors class.
                    kGradientTransparent,
                    kGradientPoint5,
                  ],
                )
              : const LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  // Add one stop for each color. Stops should increase from 0 to 1
                  stops: [0.0, 1.0],
                  colors: [
                    // Colors are easy thanks to Flutter's Colors class.
                    kGradientTransparent,
                    kGradientPointB5,
                  ],
                ),
        ),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: card.cardType == CardType.Visa
                ? const LinearGradient(
                    // Where the linear gradient begins and ends
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    // Add one stop for each color. Stops should increase from 0 to 1
                    stops: [
                      0.1,
                      0.2,
                      0.3,
                      0.40,
                      0.46,
                      0.55,
                      0.6,
                      0.7,
                      0.8,
                      0.9,
                      1.0
                    ],
                    colors: [
                      // Colors are easy thanks to Flutter's Colors class.
                      kGradientPoint1,
                      kGradientPoint2,
                      kGradientPoint3,
                      kGradientPoint2,
                      kGradientPoint5,
                      kGradientPoint4,
                      kGradientPoint5,
                      kGradientPoint4,
                      kGradientPoint3,
                      kGradientPoint2,
                      kGradientTransparent,
                    ],
                  )
                : const LinearGradient(
                    // Where the linear gradient begins and ends
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    // Add one stop for each color. Stops should increase from 0 to 1
                    stops: [
                      0.1,
                      0.2,
                      0.3,
                      0.40,
                      0.46,
                      0.55,
                      0.6,
                      0.7,
                      0.8,
                      0.9,
                      1.0
                    ],
                    colors: [
                      // Colors are easy thanks to Flutter's Colors class.
                      kGradientPointB1,
                      kGradientPointB2,
                      kGradientPointB3,
                      kGradientPointB2,
                      kGradientPointB5,
                      kGradientPointB4,
                      kGradientPointB5,
                      kGradientPointB4,
                      kGradientPointB3,
                      kGradientPointB2,
                      kGradientTransparent,
                    ],
                  ),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      card.cardType == CardType.Visa
                          ? 'Debit Card'
                          : 'Credit Card',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'GilroyLight',
                          fontWeight: FontWeight.bold),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            card.cardNumber,
                            style: TextStyle(
                              fontSize: 26.0,
                              fontFamily: 'GilroyEB',
                            ),
                          ),
                        ),
                        Text(
                          'Valid Thru ' + card.expiryDate,
                          style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'GilroyLight',
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    card.cardType == CardType.Visa
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 2.0),
                            child: Image.asset(
                              'assets/visa_logo_sm.png',
                              alignment: Alignment.bottomRight,
                              width: 76.0,
                              height: 50.0,
                            ),
                          )
                        : Image.asset(
                            'assets/mastercard_logo_sm.png',
                            alignment: Alignment.bottomRight,
                            width: 76.0,
                            height: 50.0,
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
