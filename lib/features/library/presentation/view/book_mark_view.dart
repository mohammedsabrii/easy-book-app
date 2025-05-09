import 'package:asay_book_app/core/utils/app_colors.dart';
import 'package:asay_book_app/features/home/presentation/view/widgets/custm_bottom_navgation_bar.dart';
import 'package:asay_book_app/features/library/presentation/view/widgets/favorite_view_body.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
          bottomNavigationBar: CutmBottomNavigationBar(),
          backgroundColor: AppColors.kMainColor,
          body: Padding(
            padding: EdgeInsets.all(8.0),
            child: FavoriteViewBody(),
          )),
    );
  }
}
