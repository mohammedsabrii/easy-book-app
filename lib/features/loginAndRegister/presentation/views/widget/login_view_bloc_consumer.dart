import 'package:asay_book_app/core/utils/app_router.dart';
import 'package:asay_book_app/core/utils/app_styles.dart';
import 'package:asay_book_app/core/widgets/custom_butom.dart';
import 'package:asay_book_app/core/widgets/custom_show_snackbar.dart';
import 'package:asay_book_app/features/loginAndRegister/presentation/manger/cubit/auth_cubit.dart';
import 'package:asay_book_app/features/loginAndRegister/presentation/views/widget/custom_logo_and_title.dart';
import 'package:asay_book_app/features/loginAndRegister/presentation/views/widget/custom_text_field.dart';
import 'package:asay_book_app/features/loginAndRegister/presentation/views/widget/login_with_social_platforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class LoginViewBlocConsumer extends StatelessWidget {
  LoginViewBlocConsumer({super.key});
  String? email, password;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LogInAuthSuccess) {
          GoRouter.of(context).go(AppRouter.khomeView);
          isLoading = false;
        } else if (state is LogInAuthLoading) {
          isLoading = true;
        } else if (state is LogInAuthFaliuer) {
          customShowSnackBar(context, title: state.erorrMassage);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 25,
              children: [
                const SizedBox(
                  height: 85,
                ),
                const CustomLogoAndTitle(),
                Text(
                  'LogIn',
                  style: AppStyles.styleBold24(context)
                      .copyWith(color: Colors.white, fontSize: 32),
                ),
                CustomTextFaild(
                  validator: (data) {
                    if (data!.isEmpty) {
                      return 'field is required';
                    }
                    return null;
                  },
                  onChanged: (data) {
                    email = data;
                  },
                  lableText: 'Email',
                  suffixIcon: Icons.alternate_email,
                ),
                CustomTextFaild(
                  obscureText: true,
                  validator: (data) {
                    if (data!.isEmpty) {
                      return 'field is required';
                    }
                    return null;
                  },
                  onChanged: (data) {
                    password = data;
                  },
                  lableText: 'Password',
                  suffixIcon: Icons.key,
                ),
                CustomButom(
                  title: 'LogIn',
                  onTap: () async {
                    BlocProvider.of<AuthCubit>(context).logInUser(
                      context,
                      email: email!,
                      password: password!,
                    );
                  },
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : null,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      r'Do you have an account ?',
                      style: AppStyles.styleBold14(context)
                          .copyWith(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.kRegisterView);
                      },
                      child: Text(
                        'Register',
                        style: AppStyles.styleBold14(context)
                            .copyWith(color: Colors.blueAccent),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                const Align(child: LogInWithSocialPlatforms()),
              ],
            ),
          ),
        );
      },
    );
  }
}
