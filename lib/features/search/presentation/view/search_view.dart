import 'package:asay_book_app/core/utils/app_colors.dart';
import 'package:asay_book_app/features/home/presentation/view/widgets/custm_bottom_navgation_bar.dart';
import 'package:asay_book_app/features/search/presentation/view/widgets/search_bloc_builder.dart';

import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CutmBottomNavigationBar(),
      backgroundColor: AppColors.kMainColor,
      body: SearchBlocBuilder(),
    );
  }
}
