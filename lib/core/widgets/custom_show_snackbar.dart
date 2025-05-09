import 'package:asay_book_app/core/utils/app_colors.dart';
import 'package:asay_book_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

void customShowSnackBar(BuildContext context, {required String title}) {
  var snackBar = SnackBar(
    content: Text(
      title,
      style: AppStyles.styleBold14(context).copyWith(color: Colors.white),
    ),
    backgroundColor: AppColors.kSecondColor,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    margin: const EdgeInsets.all(16),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
