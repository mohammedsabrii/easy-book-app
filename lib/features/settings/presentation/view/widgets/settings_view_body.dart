import 'package:asay_book_app/core/utils/app_router.dart';
import 'package:asay_book_app/core/widgets/custm_app_bar.dart';
import 'package:asay_book_app/features/settings/presentation/view/widgets/custom_logout_widget.dart';
import 'package:asay_book_app/features/settings/presentation/view/widgets/custom_settings_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(title: 'Settings'),
            const SizedBox(
              height: 16,
            ),
            CustomSettingWidget(
              icon: Icons.person,
              title: 'Change Your Name',
              onTap: () {
                GoRouter.of(context).push(AppRouter.kChangeNameView);
              },
            ),
            CustomSettingWidget(
              icon: Icons.alternate_email,
              title: 'Change Email',
              onTap: () {
                GoRouter.of(context).push(AppRouter.kChangeEmailView);
              },
            ),
            CustomSettingWidget(
              icon: Icons.key,
              title: 'Change Password',
              onTap: () {
                GoRouter.of(context).push(AppRouter.kChangePasswordView);
              },
            ),
            const Spacer(),
            const CustomLogoutWidget(),
          ],
        ),
      ),
    );
  }
}
