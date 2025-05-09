import 'package:asay_book_app/core/utils/app_styles.dart';
import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
import 'package:flutter/material.dart';

class ReateWidget extends StatelessWidget {
  const ReateWidget({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.book,
  });
  final BookEntity book;
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.022,
          width: MediaQuery.sizeOf(context).width * 0.26,
          child: Text(
            book.auther!,
            textWidthBasis: TextWidthBasis.parent,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.styleReglur14(context)
                .copyWith(fontSize: 12, color: const Color(0xFF515151)),
          ),
        ),
        CustomRate(
          bookEntity: book,
        ),
      ],
    );
  }
}

class CustomRate extends StatelessWidget {
  const CustomRate({
    super.key,
    required this.bookEntity,
  });
  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star_rounded,
          color: Color(0xFFFCC400),
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          bookEntity.rate.toString(),
          style: AppStyles.styleReglur10(context),
        ),
      ],
    );
  }
}
