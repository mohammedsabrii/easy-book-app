import 'package:asay_book_app/features/home/domin/repos/payment_repo.dart';
import 'package:asay_book_app/features/home/model/amount_model/amount_model.dart';
import 'package:asay_book_app/features/home/model/items_list_model/items_list_model.dart';
import 'package:asay_book_app/features/home/model/payment_intent_input_model.dart';
import 'package:asay_book_app/core/widgets/paypal_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.paymentRepo) : super(StripePaymentInitial());
  final PaymentRepo paymentRepo;
  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(StripePaymentLoading());
    var data = await paymentRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);
    data.fold(
      (failure) {
        emit(
          StripePaymentFailure(
            errorMassage: failure.toString(),
          ),
        );
        print(failure);
      },
      (success) => emit(
        StripePaymentSuccess(),
      ),
    );
  }

  void makePayPalPayment(BuildContext context,
      ({AmountModel amount, ItemsListModel itemList}) transactionsData) async {
    emit(PaypalPaymentLoading());
    try {
      navigetPaypalPayment(context, transactionsData);
    } catch (e) {
      emit(PaypalPaymentFailure());
    }
  }
}
