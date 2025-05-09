import 'package:asay_book_app/core/utils/app_colors.dart';
import 'package:asay_book_app/core/widgets/custom_butom.dart';
import 'package:asay_book_app/core/widgets/custom_favorite_button.dart';
import 'package:asay_book_app/core/widgets/lanch_url.dart';
import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
import 'package:asay_book_app/features/home/presentation/view/widgets/payment_mothods_button_sheet.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';

class CustomBottomNavigationBarForBookDetails extends StatelessWidget {
  const CustomBottomNavigationBarForBookDetails({
    super.key,
    required this.bookEntity,
  });
  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    final favoritesBox = Hive.box<BookEntity>('favorites');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: ValueListenableBuilder(
          valueListenable: favoritesBox.listenable(),
          builder: (context, Box<BookEntity> favorites, _) {
            final books = bookEntity;
            final isFav = favorites.get(books.bookId) != null;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                customFavoriteButton(context, isFav, favorites, books),
                bookEntity.getpriceWidget(),
              ],
            );
          }),
    );
  }
}

// ignore: must_be_immutable
class NoPriceBottom extends StatelessWidget {
  NoPriceBottom({
    super.key,
    required this.url,
  });
  final String url;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.sizeOf(context).width * .7,
      child: CustomButom(
        isLoading: isLoading,
        title: 'Free',
        onTap: () {
          launchCustomUr(context, url);
          isLoading = true;
        },
      ),
    );
  }
}

class PriceBottom extends StatelessWidget {
  const PriceBottom({
    super.key,
    required this.price,
    required this.amount,
  });
  final num price;
  final num amount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.sizeOf(context).width * .7,
      child: CustomButom(
        title: '${price.toString()} EGP',
        onTap: () {
          showModalBottomSheet(
            backgroundColor: AppColors.kSecondColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            context: context,
            builder: (context) {
              return PaymentMethodsBottomSheet(
                amount: amount,
              );
            },
          );
        },
      ),
    );
  }
}
