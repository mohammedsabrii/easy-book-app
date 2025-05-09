import 'package:asay_book_app/core/utils/app_colors.dart';
import 'package:asay_book_app/features/loginAndRegister/presentation/views/widget/register_view_body.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            AppColors.kSecondColor,
            AppColors.kMainColor,
          ])),
          child: SafeArea(child: RegisterViewBody())),
    );
  }
}
