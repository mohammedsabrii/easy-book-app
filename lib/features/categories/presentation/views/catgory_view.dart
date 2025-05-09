import 'package:asay_book_app/core/utils/app_colors.dart';
import 'package:asay_book_app/features/categories/presentation/views/widget/category_view_body.dart';
import 'package:flutter/material.dart';

class CatgoryView extends StatelessWidget {
  const CatgoryView({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.kMainColor,
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: CategoryViewBody(
              catgoryName: category,
            ),
          )),
    );
  }
}
