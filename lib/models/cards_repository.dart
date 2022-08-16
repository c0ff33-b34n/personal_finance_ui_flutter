import 'card_model.dart';

class PaymentCardsRepository {
  static List<PaymentCard> loadPaymentCards() {
    const paymentCards = <PaymentCard>[
      PaymentCard(
        cardType: CardType.Visa,
        cardNumber: '**** 6412',
        expiryDate: '06/25',
      ),
      PaymentCard(
        cardType: CardType.Mastercard,
        cardNumber: '**** 7254',
        expiryDate: '08/23',
      ),
    ];

    return paymentCards;
  }
}
