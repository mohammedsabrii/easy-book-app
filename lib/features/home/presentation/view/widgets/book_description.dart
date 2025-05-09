import 'package:asay_book_app/core/utils/app_styles.dart';
import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
import 'package:flutter/material.dart';

class BookDescription extends StatelessWidget {
  const BookDescription({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Description',
            style: AppStyles.styleBold24(context),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            book.descriptions!,
            style: AppStyles.styleBold14(context).copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
