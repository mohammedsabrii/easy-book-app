import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
import 'package:flutter/material.dart';

class CustomFavoriteItemImage extends StatelessWidget {
  const CustomFavoriteItemImage({
    super.key,
    required this.book,
  });

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.13,
      width: MediaQuery.of(context).size.width * 0.17,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            book.image ?? '',
          ),
          fit: BoxFit.fill,
        ),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15), bottomLeft: Radius.circular(16)),
      ),
    );
  }
}
