import 'package:asay_book_app/core/errors/failure.dart';
import 'package:asay_book_app/features/home/model/payment_intent_input_model.dart';
import 'package:dartz/dartz.dart';

abstract class PaymentRepo {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}
