enum CardType { Debit, Credit }

class PaymentCard {
  const PaymentCard(
      {required this.cardType,
      required this.cardNumber,
      required this.expiryDate});
  final CardType cardType;
  final String cardNumber;
  final String expiryDate;
}
