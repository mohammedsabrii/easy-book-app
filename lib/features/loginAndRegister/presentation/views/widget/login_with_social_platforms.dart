import 'package:asay_book_app/core/utils/assets_app.dart';
import 'package:asay_book_app/features/loginAndRegister/presentation/manger/cubit/auth_cubit.dart';
import 'package:asay_book_app/features/loginAndRegister/presentation/views/widget/custom_login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInWithSocialPlatforms extends StatelessWidget {
  const LogInWithSocialPlatforms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        CustomLogInWidget(
            onTap: () {
              BlocProvider.of<AuthCubit>(context).signInWithGoogle(
                context,
              );
            },
            color: Colors.white,
            titleColor: Colors.black,
            image: AssetsApp.kGoogleLogo,
            title: 'Continue With Google'),
      ],
    );
  }
}
