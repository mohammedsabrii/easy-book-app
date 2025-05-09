import 'package:asay_book_app/core/utils/app_colors.dart';
import 'package:asay_book_app/core/utils/app_styles.dart';
import 'package:asay_book_app/core/widgets/custm_app_bar.dart';
import 'package:asay_book_app/core/widgets/custom_butom.dart';
import 'package:asay_book_app/features/loginAndRegister/presentation/views/widget/custom_text_field.dart';
import 'package:asay_book_app/features/settings/presentation/manger/change_name_method.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChangeNameViewBody extends StatefulWidget {
  const ChangeNameViewBody({super.key});

  @override
  State<ChangeNameViewBody> createState() => _ChangeNameViewBodyState();
}

class _ChangeNameViewBodyState extends State<ChangeNameViewBody> {
  String? username, password, email;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const CustomAppBar(
            title: 'Change Your Name',
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Caurnt Name',
            style: AppStyles.styleBold20(context).copyWith(
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            canRequestFocus: false,
            style:
                AppStyles.styleReglur14(context).copyWith(color: Colors.white),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              labelText:
                  FirebaseAuth.instance.currentUser!.displayName.toString(),
              labelStyle: AppStyles.styleReglur16(context)
                  .copyWith(color: Colors.white, fontSize: 18),
              suffixIcon: const Icon(Icons.person),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: AppColors.kSecondColor),
                gapPadding: 12,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextFaild(
            lableText: 'Enter New Name',
            suffixIcon: Icons.person,
            onChanged: (data) {
              username = data;
            },
          ),
          const SizedBox(
            height: 12,
          ),
          CustomButom(
            title: 'Change Name',
            onTap: () async {
              await changeNameMethod(context,
                  userName: username!, password: password);
              setState(() {});
            },
          )
        ]),
      ),
    );
  }
}
