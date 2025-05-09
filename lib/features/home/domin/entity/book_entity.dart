import 'package:asay_book_app/features/home/presentation/view/widgets/custom_bottom_navigation_bar_for_book_details.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String? image;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? auther;
  @HiveField(3)
  final num? rate;
  @HiveField(4)
  final num? pagenumpers;
  @HiveField(5)
  final String? priceState;
  @HiveField(6)
  final String? descriptions;
  @HiveField(7)
  final String? catgory;
  @HiveField(8)
  final num? price;
  @HiveField(9)
  final String bookId;
  @HiveField(10)
  final String? url;

  BookEntity(
      {required this.image,
      required this.title,
      required this.auther,
      this.rate,
      required this.pagenumpers,
      required this.price,
      required this.descriptions,
      required this.catgory,
      required this.priceState,
      required this.bookId,
      required this.url});
  String getPrice() {
    if (priceState == 'FOR_SALE') {
      return price.toString();
    } else if (priceState == 'NOT_FOR_SALE') {
      return 'Free';
    } else if (priceState == 'FREE') {
      return 'Free';
    } else {
      return 'Free';
    }
  }

  Widget getpriceWidget() {
    if (priceState == 'FOR_SALE') {
      return PriceBottom(
        amount: price!.toInt(),
        price: price!.toInt(),
      );
    } else if (priceState == 'NOT_FOR_SALE') {
      return NoPriceBottom(
        url: url ?? '',
      );
    } else if (priceState == 'FREE') {
      return NoPriceBottom(
        url: url ?? '',
      );
    } else {
      return NoPriceBottom(
        url: url ?? '',
      );
    }
  }
}
