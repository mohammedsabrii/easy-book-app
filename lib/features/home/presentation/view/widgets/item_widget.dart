import 'package:asay_book_app/core/utils/app_router.dart';
import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
import 'package:asay_book_app/features/home/presentation/view/widgets/item_detiles.dart';
import 'package:asay_book_app/features/home/presentation/view/widgets/popular_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kDetailsView, extra: book);
      },
      child: Container(
          height: MediaQuery.sizeOf(context).height * 0.29,
          width: MediaQuery.of(context).size.width * 0.44,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(16)),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(bottom: 10, child: ItemDetiles(book: book)),
              PopularBooksImage(book: book),
            ],
          )),
    );
  }
}
