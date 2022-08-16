enum CardType { Visa, Mastercard }

class PaymentCard {
  const PaymentCard(
      {required this.cardType,
      required this.cardNumber,
      required this.expiryDate});
  final CardType cardType;
  final String cardNumber;
  final String expiryDate;

  String get cardTypeString => cardType.toString().split('.').last;
}
