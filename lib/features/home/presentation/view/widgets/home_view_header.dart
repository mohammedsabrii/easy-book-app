import 'package:asay_book_app/features/categories/presentation/views/widget/category_list_viev.dart';
import 'package:asay_book_app/features/home/presentation/view/widgets/custom_app_bar_to_home.dart';
import 'package:flutter/material.dart';

class HomeViewHeader extends StatelessWidget {
  const HomeViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.13,
      child: const Column(
        children: [
          CustomAppBarToHome(),
          SizedBox(height: 5),
          CatgoryListView(),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
