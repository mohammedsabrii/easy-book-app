import 'package:asay_book_app/core/utils/app_router.dart';
import 'package:asay_book_app/core/utils/app_styles.dart';
import 'package:asay_book_app/core/widgets/custom_butom.dart';
import 'package:asay_book_app/core/widgets/custom_show_snackbar.dart';
import 'package:asay_book_app/features/loginAndRegister/presentation/manger/cubit/auth_cubit.dart';
import 'package:asay_book_app/features/loginAndRegister/presentation/views/widget/custom_logo_and_title.dart';
import 'package:asay_book_app/features/loginAndRegister/presentation/views/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class RegisterViewBody extends StatelessWidget {
  RegisterViewBody({super.key});
  String? email, password, username, confirmPassword;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterAuthLoading) {
          isLoading = true;
        } else if (state is RegisterAuthSuccess) {
          GoRouter.of(context).pushReplacement(AppRouter.khomeView);
          isLoading = false;
        } else if (state is RegisterAuthFaliuer) {
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
                  'Register',
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
                  lableText: 'Enter Your Name',
                  suffixIcon: Icons.person,
                  onChanged: (data) {
                    username = data;
                  },
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
                  lableText: 'Enter Your Email',
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
                  lableText: 'Enter Password',
                  suffixIcon: Icons.key,
                ),
                CustomTextFaild(
                  obscureText: true,
                  validator: (data) {
                    if (data!.isEmpty) {
                      return 'field is required';
                    }
                    return null;
                  },
                  lableText: 'Enter Password Agin',
                  suffixIcon: Icons.key,
                  onChanged: (data) {
                    confirmPassword = data;
                  },
                ),
                CustomButom(
                  title: 'Register',
                  onTap: () async {
                    BlocProvider.of<AuthCubit>(context).registerUser(context,
                        email: email!,
                        password: password!,
                        confirmPassword: confirmPassword!,
                        username: username!);
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
                        Navigator.pop(context);
                      },
                      child: Text(
                        r'LogIn',
                        style: AppStyles.styleBold14(context)
                            .copyWith(color: Colors.blueAccent),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
