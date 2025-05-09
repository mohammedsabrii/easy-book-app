import 'package:asay_book_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CutmBottomNavigationBar extends StatelessWidget {
  const CutmBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                GoRouter.of(context).go(AppRouter.khomeView);
              },
              icon: SvgPicture.asset(
                'assets/images/home.svg',
                height: 30,
                width: 30,
              )),
          IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kBookMarks);
              },
              icon: SvgPicture.asset(
                'assets/images/bookmark2.svg',
                height: 30,
                width: 30,
              )),
          IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kSettingsView);
              },
              icon: SvgPicture.asset(
                'assets/images/profile.svg',
                height: 30,
                width: 30,
              )),
        ],
      ),
    );
  }
}
