import 'package:asay_book_app/core/utils/app_router.dart';
import 'package:asay_book_app/core/utils/app_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomLogoutWidget extends StatelessWidget {
  const CustomLogoutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await FirebaseAuth.instance.signOut();
        GoRouter.of(context).go(AppRouter.kLoginView);
      },
      child: Container(
        height: 40,
        width: 150,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 233, 25, 10),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            const Icon(
              Icons.logout,
              size: 28,
              color: Colors.white,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              'Log out',
              style: AppStyles.styleSemiBold18(context)
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
