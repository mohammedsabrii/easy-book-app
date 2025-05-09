import 'package:asay_book_app/core/utils/app_styles.dart';
import 'package:asay_book_app/core/utils/assets_app.dart';
import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AssetsApp.kLogo,
          height: MediaQuery.sizeOf(context).height * 0.04,
          width: 70,
        ),
        Text(
          'Easy Book',
          style: AppStyles.styleSemiBold14(context).copyWith(fontSize: 16),
        )
      ],
    );
  }
}
