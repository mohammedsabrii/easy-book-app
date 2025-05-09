import 'package:asay_book_app/features/onBording/presentation/data/static.dart';
import 'package:asay_book_app/features/onBording/presentation/view/widgets/custom_dot_idctor.dart';
import 'package:flutter/material.dart';

class CustomIndcetorList extends StatelessWidget {
  const CustomIndcetorList({
    super.key,
    required this.cruntPageIndex,
  });

  final int cruntPageIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(onBordingList.length, (index) {
          return CustomDotIdctor(isActive: index == cruntPageIndex);
        }));
  }
}
