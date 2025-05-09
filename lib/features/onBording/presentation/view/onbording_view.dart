import 'package:asay_book_app/core/utils/app_colors.dart';
import 'package:asay_book_app/features/onBording/presentation/view/widgets/onbording_body.dart';
import 'package:flutter/material.dart';

class OnbordingView extends StatelessWidget {
  const OnbordingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.kMainColor,
      body: OnbordingBody(),
    );
  }
}
