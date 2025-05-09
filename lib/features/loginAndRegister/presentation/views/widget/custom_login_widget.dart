import 'package:asay_book_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomLogInWidget extends StatelessWidget {
  const CustomLogInWidget({
    super.key,
    this.onTap,
    required this.color,
    required this.titleColor,
    required this.image,
    required this.title,
  });
  final Function()? onTap;
  final Color color, titleColor;
  final String image, title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: MediaQuery.sizeOf(context).width * .63,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SvgPicture.asset(
                image,
                height: 24,
                width: 24,
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: AppStyles.styleBold14(context)
                    .copyWith(fontSize: 16, color: titleColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
