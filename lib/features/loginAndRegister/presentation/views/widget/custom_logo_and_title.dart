import 'package:asay_book_app/core/utils/app_styles.dart';
import 'package:asay_book_app/core/utils/assets_app.dart';
import 'package:flutter/material.dart';

class CustomLogoAndTitle extends StatelessWidget {
  const CustomLogoAndTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        const SizedBox(
          width: 40,
        ),
        Image.asset(
          AssetsApp.kLogo,
          fit: BoxFit.fill,
          height: MediaQuery.sizeOf(context).height * .1,
          width: MediaQuery.sizeOf(context).width * .26,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Easy Book',
              style:
                  AppStyles.styleBold24(context).copyWith(color: Colors.white),
            ),
            Text(
              'For free books',
              style:
                  AppStyles.styleBold20(context).copyWith(color: Colors.white),
            ),
          ],
        )
      ],
    );
  }
}
