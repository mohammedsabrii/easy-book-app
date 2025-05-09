import 'package:asay_book_app/features/home/presentation/view/widgets/custom_scroll_view_home_body.dart';
import 'package:asay_book_app/features/home/presentation/view/widgets/home_view_header.dart';

import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            HomeViewHeader(),
            Expanded(child: CustomScrollViewHomeBody()),
          ],
        ),
      ),
    );
  }
}
