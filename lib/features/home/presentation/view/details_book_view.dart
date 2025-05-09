import 'package:asay_book_app/core/utils/app_colors.dart';
import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
import 'package:asay_book_app/features/home/presentation/view/widgets/custom_bottom_navigation_bar_for_book_details.dart';
import 'package:asay_book_app/features/home/presentation/view/widgets/details_book_view_body.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({
    super.key,
    required this.bookEntity,
  });

  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMainColor,
      bottomNavigationBar: CustomBottomNavigationBarForBookDetails(
        bookEntity: bookEntity,
      ),
      body: DetailsBookViewBody(
        bookEntity: bookEntity,
      ),
    );
  }
}
