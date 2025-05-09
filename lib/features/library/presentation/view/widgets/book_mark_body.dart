import 'package:asay_book_app/core/widgets/custm_app_bar.dart';
import 'package:flutter/material.dart';

class BookMarkBody extends StatelessWidget {
  const BookMarkBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            CustomAppBar(
              title: 'BookMarks',
            )
          ],
        ),
      ),
    );
  }
}
