class PaymentIntentInputModel {
  final String currency;
  final num amount;

  PaymentIntentInputModel({required this.amount, required this.currency});
  toJson() {
    return {
      'amount': '${amount * 100}',
      'currency': currency,
    };
  }
}
