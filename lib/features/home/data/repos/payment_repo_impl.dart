import 'package:asay_book_app/core/errors/failure.dart';
import 'package:asay_book_app/core/service/stripe_service.dart';
import 'package:asay_book_app/features/home/domin/repos/payment_repo.dart';
import 'package:asay_book_app/features/home/model/payment_intent_input_model.dart';
import 'package:dartz/dartz.dart';

class PaymentRepoImpl extends PaymentRepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
