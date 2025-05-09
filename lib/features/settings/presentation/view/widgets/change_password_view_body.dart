import 'package:asay_book_app/core/utils/app_styles.dart';
import 'package:asay_book_app/core/widgets/custm_app_bar.dart';
import 'package:asay_book_app/core/widgets/custom_butom.dart';
import 'package:asay_book_app/core/widgets/custom_show_snackbar.dart';
import 'package:asay_book_app/features/loginAndRegister/presentation/views/widget/custom_text_field.dart';
import 'package:asay_book_app/features/settings/presentation/manger/change_password_method.dart';
import 'package:flutter/material.dart';

class ChangePasswordViewBody extends StatefulWidget {
  const ChangePasswordViewBody({super.key});

  @override
  State<ChangePasswordViewBody> createState() => _ChangePasswordViewBodyState();
}

class _ChangePasswordViewBodyState extends State<ChangePasswordViewBody> {
  String? password, newPassword, confirmNewPassword;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const CustomAppBar(
            title: 'Change Password',
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Caurnt Email',
            style: AppStyles.styleBold20(context).copyWith(
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 8,
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
            lableText: 'Enter Curent Password',
            suffixIcon: Icons.key,
          ),
          const SizedBox(
            height: 12,
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
              newPassword = data;
            },
            lableText: 'Enter New Password',
            suffixIcon: Icons.key,
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextFaild(
            obscureText: true,
            validator: (data) {
              if (data!.isEmpty) {
                return 'field is required';
              }
              return null;
            },
            lableText: 'Enter New Password Agin',
            suffixIcon: Icons.key,
            onChanged: (data) {
              confirmNewPassword = data;
            },
          ),
          const SizedBox(
            height: 12,
          ),
          CustomButom(
              title: 'Change Password',
              onTap: () async {
                if (newPassword != confirmNewPassword) {
                  customShowSnackBar(context, title: 'Passwords do not match.');
                  return;
                }
                await changePasswordMethod(context,
                    password: password!, newPassword: newPassword);
                setState(() {});
              })
        ]),
      ),
    );
  }
}
