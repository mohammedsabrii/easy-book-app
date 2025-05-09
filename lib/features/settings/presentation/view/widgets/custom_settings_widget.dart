import 'package:asay_book_app/core/utils/app_colors.dart';
import 'package:asay_book_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomSettingWidget extends StatelessWidget {
  const CustomSettingWidget(
      {super.key,
      required this.title,
      required this.onTap,
      required this.icon});
  final String title;
  final Function() onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: AppColors.kSecondColor,
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: AppStyles.styleSemiBold18(context)
                  .copyWith(color: Colors.white),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.white,
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
      ),
    );
  }
}
