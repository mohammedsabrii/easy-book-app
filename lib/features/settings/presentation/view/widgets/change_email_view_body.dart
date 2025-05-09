import 'package:asay_book_app/core/utils/app_styles.dart';
import 'package:asay_book_app/core/widgets/custm_app_bar.dart';
import 'package:asay_book_app/core/widgets/custom_butom.dart';
import 'package:asay_book_app/features/loginAndRegister/presentation/views/widget/custom_text_field.dart';
import 'package:asay_book_app/features/settings/presentation/manger/change_email_method.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChangeEmailViewBody extends StatefulWidget {
  const ChangeEmailViewBody({super.key});

  @override
  State<ChangeEmailViewBody> createState() => _ChangeEmailViewBodyState();
}

class _ChangeEmailViewBodyState extends State<ChangeEmailViewBody> {
  String? email, newEmail, password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const CustomAppBar(
            title: 'Change Email',
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
            lableColor: Colors.white,
            obscureText: true,
            lableText: FirebaseAuth.instance.currentUser!.email.toString(),
            suffixIcon: Icons.person,
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextFaild(
            lableText: 'Enter New Email',
            suffixIcon: Icons.person,
            onChanged: (data) {
              newEmail = data;
            },
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
            lableText: 'Password',
            suffixIcon: Icons.key,
            onChanged: (data) {
              password = data;
            },
          ),
          const SizedBox(
            height: 12,
          ),
          CustomButom(
              title: 'Change Email',
              onTap: () async {
                await changeEmailMethod(context,
                    password: password!, newEmail: newEmail);
                setState(() {});
              })
        ]),
      ),
    );
  }
}
