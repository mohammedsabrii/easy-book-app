import 'package:asay_book_app/core/utils/app_colors.dart';
import 'package:asay_book_app/core/utils/assets_app.dart';
import 'package:asay_book_app/features/home/presentation/view/widgets/custm_bottom_navgation_bar.dart';
import 'package:asay_book_app/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CutmBottomNavigationBar(),
      backgroundColor: AppColors.kMainColor,
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AssetsApp.kBackGroudImage))),
          child: const HomeViewBody()),
    );
  }
}
