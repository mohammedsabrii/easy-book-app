import 'package:asay_book_app/core/utils/app_colors.dart';
import 'package:asay_book_app/features/home/presentation/view/widgets/custm_bottom_navgation_bar.dart';
import 'package:asay_book_app/features/settings/presentation/view/widgets/change_email_view_body.dart';
import 'package:flutter/material.dart';

class ChangeEmailView extends StatelessWidget {
  const ChangeEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CutmBottomNavigationBar(),
      backgroundColor: AppColors.kMainColor,
      body: ChangeEmailViewBody(),
    );
  }
}
