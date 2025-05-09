import 'package:asay_book_app/core/utils/app_styles.dart';
import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
import 'package:flutter/material.dart';

class FavoriteItemDetailes extends StatelessWidget {
  const FavoriteItemDetailes({
    super.key,
    required this.book,
  });

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * .5,
          child: Text(
            book.title ?? 'No Title',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.styleBold20(context).copyWith(fontSize: 16),
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          book.auther ?? 'No Author',
          maxLines: 1,
          style: AppStyles.styleBold14(context).copyWith(color: Colors.grey),
        ),
        const SizedBox(
          height: 3,
        ),
        Row(
          children: [
            Text(
              book.getPrice(),
              style: AppStyles.styleBold20(context),
            ),
          ],
        ),
      ],
    );
  }
}
