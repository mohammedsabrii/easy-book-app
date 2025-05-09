import 'package:asay_book_app/core/utils/app_colors.dart';
import 'package:asay_book_app/core/utils/constens.dart';
import 'package:asay_book_app/core/widgets/custom_show_snackbar.dart';
import 'package:asay_book_app/features/home/model/amount_model/amount_model.dart';
import 'package:asay_book_app/features/home/model/amount_model/details.dart';
import 'package:asay_book_app/features/home/model/items_list_model/item.dart';
import 'package:asay_book_app/features/home/model/items_list_model/items_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:intl/intl.dart';

void navigetPaypalPayment(BuildContext context,
    ({AmountModel amount, ItemsListModel itemList}) transactionsData) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (BuildContext context) => PaypalCheckoutView(
      sandboxMode: true,
      clientId: kPaypalClintId,
      secretKey: kPaypalSecretKay,
      transactions: [
        {
          "amount": transactionsData.amount.toJson(),
          "description": "The payment transaction description.",
          "item_list": transactionsData.itemList.toJson(),
        }
      ],
      loadingIndicator:
          const CircularProgressIndicator(color: AppColors.kOrangColor),
      note: "Contact us for any questions on your order.",
      onSuccess: (Map params) async {
        Navigator.pop(context);
        customShowSnackBar(context, title: 'payment has been succeeded');
      },
      onError: (error) {
        Navigator.pop(context);
        customShowSnackBar(context,
            title: 'oops something went wrong please try again later ');
      },
      onCancel: () {
        Navigator.pop(context);
        customShowSnackBar(context, title: 'Payment has been cancelled');
      },
    ),
  ));
}

String formatPrice(num price) {
  return NumberFormat("0.00", "en_US").format(price);
}

({AmountModel amount, ItemsListModel itemList}) getTranscationsData(
    {required num price}) {
  String formattedPrice = formatPrice(price);

  var amount = AmountModel(
      currency: 'USD',
      total: formattedPrice,
      details: Details(
          subtotal: formattedPrice, shippingDiscount: 0, shipping: '0'));

  List<OrderItemModel> orders = [
    OrderItemModel(
        currency: 'USD', name: 'book', price: formattedPrice, quantity: 1),
  ];

  var itemList = ItemsListModel(items: orders);
  return (amount: amount, itemList: itemList);
}
