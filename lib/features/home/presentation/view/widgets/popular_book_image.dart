import 'package:asay_book_app/core/utils/app_router.dart';
import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PopularBooksImage extends StatelessWidget {
  const PopularBooksImage({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kDetailsView, extra: book);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.18,
        width: MediaQuery.of(context).size.width * 0.44,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              opacity: .2,
              image: NetworkImage(
                book.image ?? '',
              )),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CachedNetworkImage(
            imageUrl: book.image ?? '',
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.22,
            // Adjust as needed
          ),
        ),
      ),
    );
  }
}
