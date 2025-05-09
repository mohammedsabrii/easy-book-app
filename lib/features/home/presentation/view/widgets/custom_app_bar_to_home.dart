import 'package:asay_book_app/core/utils/app_router.dart';
import 'package:asay_book_app/core/widgets/custom_logo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBarToHome extends StatelessWidget {
  const CustomAppBarToHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomLogo(),
        IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.ksearchView);
            },
            icon: const Icon(
              Icons.search,
              size: 32,
            ))
      ],
    );
  }
}
