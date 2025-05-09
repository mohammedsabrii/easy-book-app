import 'package:asay_book_app/core/service/api_payment_service.dart';
import 'package:asay_book_app/core/utils/constens.dart';
import 'package:asay_book_app/features/home/data/model/payment_intent_model/payment_intent_model.dart';
import 'package:asay_book_app/features/home/model/payment_intent_input_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiPaymentService apiPaymentService = ApiPaymentService();

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiPaymentService.post(
        contentType: Headers.formUrlEncodedContentType,
        body: paymentIntentInputModel.toJson(),
        url: 'https://api.stripe.com/v1/payment_intents',
        token: kSecretTocen);
    var paymentItentModel = PaymentIntentModel.fromJson(response.data);
    return paymentItentModel;
  }

  Future initPaymentSheat({required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntentClientSecret,
            merchantDisplayName: 'esay book'));
  }

  Future displayPaymentSheat() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    await initPaymentSheat(
        paymentIntentClientSecret: paymentIntentModel.clientSecret!);
    await displayPaymentSheat();
  }
}
