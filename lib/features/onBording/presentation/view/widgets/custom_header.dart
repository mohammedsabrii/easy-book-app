import 'package:asay_book_app/core/utils/app_router.dart';
import 'package:asay_book_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            GoRouter.of(context).go(AppRouter.kLoginView);
          },
          child: Text(
            'Skip',
            style:
                AppStyles.styleReglur16(context).copyWith(color: Colors.white),
          ),
        )
      ],
    );
  }
}
