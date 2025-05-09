import 'package:asay_book_app/core/utils/app_styles.dart';
import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
import 'package:asay_book_app/features/home/presentation/view/widgets/custom_book_detailes_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BookDetailsHeader extends StatelessWidget {
  const BookDetailsHeader({
    super.key,
    required this.book,
  });
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .6,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, opacity: .2, image: NetworkImage(book.image!))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const CustemBookDetailsAppPar(),
            const SizedBox(
              height: 20,
            ),
            Text(
              book.title!,
              style: AppStyles.styleBold24(context),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 3,
            ),
            Opacity(
              opacity: .7,
              child: Text(
                book.auther!,
                style: AppStyles.styleSemiBold18(context).copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 33,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .20),
              child: SizedBox(
                  child: CachedNetworkImage(
                imageUrl: book.image!,
                height: MediaQuery.of(context).size.height * 0.26,
                width: MediaQuery.of(context).size.width * 0.39,
                fit: BoxFit.fill,
              )),
            ),
          ],
        ),
      ),
    );
  }
}
