import 'package:asay_book_app/core/utils/app_colors.dart';
import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
import 'package:asay_book_app/features/library/presentation/view/widgets/custom_favorite_item_image.dart';
import 'package:asay_book_app/features/library/presentation/view/widgets/favorite_item_detailes.dart';
import 'package:flutter/material.dart';

class CustomFavoriteViewItem extends StatelessWidget {
  const CustomFavoriteViewItem({
    super.key,
    required this.book,
  });

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kSecondColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          CustomFavoriteItemImage(book: book),
          const SizedBox(width: 12),
          FavoriteItemDetailes(book: book),
          SizedBox(width: MediaQuery.of(context).size.width * 0.07),
        ],
      ),
    );
  }
}
