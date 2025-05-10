import 'package:asay_book_app/core/widgets/custom_show_snackbar.dart';
import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

Container customFavoriteButton(BuildContext context, bool isFav,
    Box<BookEntity> favorites, BookEntity book) {
  return Container(
    height: 45,
    width: 45,
    decoration: BoxDecoration(
      color: const Color(0x992f3d4e),
      borderRadius: BorderRadius.circular(50),
    ),
    child: IconButton(
      onPressed: () async {
        try {
          ScaffoldMessenger.of(context).clearSnackBars();
          if (isFav) {
            await favorites.delete(book.bookId);
            customShowSnackBar(context, title: 'Removed from Favorites');
          } else {
            await favorites.put(book.bookId, book);
            customShowSnackBar(context, title: 'Added to Favorites');
          }
        } catch (e) {
          if (context.mounted) {
            customShowSnackBar(context, title: 'error $e');
          }
        }
      },
      icon: Icon(
        isFav ? Icons.favorite : Icons.favorite_border,
        color: isFav ? Colors.red : null,
      ),
    ),
  );
}
