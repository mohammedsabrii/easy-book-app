import 'package:asay_book_app/core/utils/app_colors.dart';
import 'package:asay_book_app/core/utils/app_styles.dart';
import 'package:asay_book_app/features/categories/presentation/views/catgory_view.dart';
import 'package:asay_book_app/features/home/model/catgory_model.dart';
import 'package:flutter/material.dart';

class CustomCatgory extends StatelessWidget {
  const CustomCatgory({super.key, required this.model});
  final CatgoryModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return CatgoryView(
                category: model.title,
              );
            },
          ));
        },
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColors.kSecondColor),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  model.icon,
                  width: 26,
                  height: 26,
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  model.title,
                  style: AppStyles.styleBold14(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
