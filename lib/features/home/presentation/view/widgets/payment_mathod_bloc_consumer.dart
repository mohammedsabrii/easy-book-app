import 'package:asay_book_app/core/widgets/custom_show_snackbar.dart';
import 'package:asay_book_app/features/home/presentation/manger/cubits/payment_cubit/payment_cubit.dart';
import 'package:asay_book_app/features/home/presentation/view/widgets/payment_method_List_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class PaymentMethodsBlocConsumer extends StatelessWidget {
  PaymentMethodsBlocConsumer({super.key, required this.amount});
  final num amount;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is StripePaymentSuccess) {
          Navigator.pop(context);
          customShowSnackBar(context, title: 'Pyment Success');
          isLoading = false;
        } else if (state is StripePaymentFailure) {
          Navigator.pop(context);
          customShowSnackBar(context,
              title: 'oops something went wrong please try again later ');
          isLoading = false;
        } else if (state is StripePaymentLoading) {
          isLoading = true;
        } else if (state is PaypalPaymentLoading) {
          isLoading = true;
        } else if (state is PaypalPaymentSuccess) {
          Navigator.pop(context);
          customShowSnackBar(context, title: 'Pyment Success');
          isLoading = false;
        } else if (state is StripePaymentFailure) {
          Navigator.pop(context);
          customShowSnackBar(context,
              title: 'oops something went wrong please try again later ');
          isLoading = false;
        }
      },
      builder: (context, state) {
        return PaymentMethodBulider(
          amount: amount,
          isLoading: isLoading,
        );
      },
    );
  }
}
