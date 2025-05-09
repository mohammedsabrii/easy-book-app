import 'package:asay_book_app/core/utils/app_styles.dart';
import 'package:asay_book_app/features/home/presentation/view/widgets/reccommended_for_you_bloc_bulider.dart';
import 'package:flutter/material.dart';

class RecommendedForYou extends StatelessWidget {
  const RecommendedForYou({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recommended For You',
          style: AppStyles.styleBold20(context),
        ),
        const SizedBox(
          height: 8,
        ),
        RecommededForYouBlocBuilder()
      ],
    );
  }
}
