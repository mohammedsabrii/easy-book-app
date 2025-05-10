import 'package:asay_book_app/core/utils/app_colors.dart';
import 'package:asay_book_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomButom extends StatelessWidget {
  const CustomButom({
    super.key,
    required this.title,
    this.onTap,
    this.isLoading = false,
    this.child,
  });
  final String title;
  final VoidCallback? onTap;
  final bool isLoading;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 900),
        decoration: BoxDecoration(
            color: AppColors.kOrangColor,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: child ??
                (isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : Text(
                        title,
                        textAlign: TextAlign.center,
                        style: AppStyles.styleBold20(context).copyWith(
                          color: Colors.white,
                        ),
                      )),
          ),
        ),
      ),
    );
  }
}
