import 'package:asay_book_app/core/utils/app_colors.dart';
import 'package:asay_book_app/core/utils/app_router.dart';
import 'package:asay_book_app/core/utils/app_styles.dart';
import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
import 'package:asay_book_app/features/home/presentation/view/widgets/custm_rate.dart';
import 'package:asay_book_app/features/home/presentation/view/widgets/popular_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemDetiles extends StatelessWidget {
  const ItemDetiles({super.key, required this.book});
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kDetailsView, extra: book);
      },
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.12,
        width: MediaQuery.of(context).size.width * 0.44,
        decoration: const BoxDecoration(
            color: AppColors.kSecondColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                book.title!,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.styleBold14(context),
              ),
              ReateWidget(
                book: book,
              ),
              Text(
                book.getPrice(),
                style:
                    AppStyles.styleSemiBold14(context).copyWith(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.sizeOf(context).height * 0.29,
        width: MediaQuery.of(context).size.width * 0.44,
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(16)),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(bottom: 10, child: ItemDetiles(book: book)),
            PopularBooksImage(book: book),
          ],
        ));
  }
}
