import 'package:asay_book_app/core/widgets/custom_butom.dart';
import 'package:asay_book_app/features/home/model/payment_intent_input_model.dart';
import 'package:asay_book_app/features/home/presentation/manger/cubits/payment_cubit/payment_cubit.dart';
import 'package:asay_book_app/features/home/presentation/view/widgets/payment_method_item.dart';
import 'package:asay_book_app/core/widgets/paypal_payment.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentMethodBulider extends StatefulWidget {
  const PaymentMethodBulider(
      {super.key, required this.amount, this.isLoading = false});
  final num amount;
  final bool isLoading;
  @override
  State<PaymentMethodBulider> createState() => _PaymentMethodBuliderState();
}

class _PaymentMethodBuliderState extends State<PaymentMethodBulider> {
  final List<String> methodes = [
    'assets/images/card.svg',
    'assets/images/paypal.svg'
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: Column(
        children: [
          SizedBox(
            height: 80,
            child: ListView.builder(
              itemCount: methodes.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          activeIndex = index;
                          setState(() {});
                        },
                        child: PaymentMethodItem(
                          isAcive: activeIndex == index,
                          image: methodes[index],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 34,
          ),
          CustomButom(
            child: widget.isLoading
                ? const SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : null,
            title: 'Continue',
            onTap: () {
              if (activeIndex == 0) {
                PaymentIntentInputModel paymentIntentInputModel =
                    PaymentIntentInputModel(
                        amount: widget.amount, currency: 'egp');
                BlocProvider.of<PaymentCubit>(context).makePayment(
                    paymentIntentInputModel: paymentIntentInputModel);
              } else {
                var transactionsData =
                    getTranscationsData(price: widget.amount);
                BlocProvider.of<PaymentCubit>(context)
                    .makePayPalPayment(context, transactionsData);
              }
            },
          )
        ],
      ),
    );
  }
}
