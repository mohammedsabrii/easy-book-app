part of 'payment_cubit.dart';

@immutable
sealed class PaymentState {}

final class StripePaymentInitial extends PaymentState {}

final class StripePaymentSuccess extends PaymentState {}

final class StripePaymentFailure extends PaymentState {
  final String errorMassage;

  StripePaymentFailure({required this.errorMassage});
}

final class StripePaymentLoading extends PaymentState {}

final class PaypalPaymentFailure extends PaymentState {}

final class PaypalPaymentLoading extends PaymentState {}

final class PaypalPaymentSuccess extends PaymentState {}
