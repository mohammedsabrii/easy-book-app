import 'package:asay_book_app/features/home/presentation/view/widgets/payment_mathod_bloc_consumer.dart';
import 'package:flutter/widgets.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key, required this.amount});
  final num amount;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
          ),
          PaymentMethodsBlocConsumer(
            amount: amount,
          ),
        ],
      ),
    );
  }
}
