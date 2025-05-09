import 'package:asay_book_app/core/utils/app_colors.dart';
import 'package:asay_book_app/core/utils/app_styles.dart';
import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
import 'package:asay_book_app/features/home/presentation/view/widgets/custm_rate.dart';
import 'package:flutter/material.dart';

class BookInFormation extends StatelessWidget {
  const BookInFormation({
    super.key,
    required this.bookEintity,
  });
  final BookEntity bookEintity;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 50,
      decoration: BoxDecoration(
          color: AppColors.kSecondColor,
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomRate(
            bookEntity: bookEintity,
          ),
          Container(
              height: 23,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0x99E2FCFB)),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Text(
                  bookEintity.catgory ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.styleReglur14(context)
                      .copyWith(color: Colors.black),
                ),
              ))),
          Text(
            '${bookEintity.pagenumpers} Pages',
            style: AppStyles.styleBold14(context),
          ),
        ],
      ),
    );
  }
}
