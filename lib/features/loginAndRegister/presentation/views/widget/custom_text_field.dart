import 'package:asay_book_app/core/utils/app_colors.dart';
import 'package:asay_book_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFaild extends StatelessWidget {
  const CustomTextFaild(
      {super.key,
      required this.lableText,
      required this.suffixIcon,
      this.onChanged,
      this.validator,
      this.obscureText = false,
      this.canRequestFocus = true,
      this.lableColor = Colors.grey});
  final String lableText;
  final IconData suffixIcon;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final bool obscureText, canRequestFocus;
  final Color lableColor;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      canRequestFocus: canRequestFocus,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      style: AppStyles.styleReglur14(context).copyWith(color: Colors.white),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        labelText: lableText,
        labelStyle:
            AppStyles.styleReglur14(context).copyWith(color: lableColor),
        suffixIcon: Icon(suffixIcon),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.kSecondColor),
          gapPadding: 12,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.white),
          gapPadding: 12,
        ),
      ),
    );
  }
}
