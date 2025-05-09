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
// import 'package:asay_book_app/core/utils/app_colors.dart';
// import 'package:asay_book_app/core/utils/app_styles.dart';
// import 'package:flutter/material.dart';

// class CustomButton extends StatelessWidget {
//   const CustomButton({
//     super.key,
//     required this.title,
//     this.onTap,
//     this.isLoading = false,
//     this.backgroundColor = AppColors.kOrangColor,
//     this.textStyle,
//     this.borderRadius = 20.0,
//     this.padding = const EdgeInsets.all(8.0),
//     this.width,
//     this.height,
//     this.loadingIndicatorColor = Colors.white,
//     this.isEnabled = true,
//     this.child, // Added child parameter for compatibility
//   });

//   final String title;
//   final Future<void> Function()? onTap; // Changed to support async
//   final bool isLoading;
//   final Color backgroundColor;
//   final TextStyle? textStyle;
//   final double borderRadius;
//   final EdgeInsets padding;
//   final double? width;
//   final double? height;
//   final Color loadingIndicatorColor;
//   final bool isEnabled;
//   final Widget? child; // Added to match your original usage

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: (isLoading || !isEnabled || onTap == null)
//           ? null
//           : () async => await onTap!(),
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 300),
//         width: width,
//         height: height,
//         decoration: BoxDecoration(
//           color: isEnabled ? backgroundColor : backgroundColor.withOpacity(0.5),
//           borderRadius: BorderRadius.circular(borderRadius),
//         ),
//         padding: padding,
//         child: Center(
//           child: child ?? // Use child if provided
//               (isLoading
//                   ? SizedBox(
//                       width: 24,
//                       height: 24,
//                       child: CircularProgressIndicator(
//                         color: loadingIndicatorColor,
//                         strokeWidth: 2.5,
//                       ),
//                     )
//                   : Text(
//                       title,
//                       textAlign: TextAlign.center,
//                       style: textStyle ??
//                           AppStyles.styleBold20(context).copyWith(
//                             color: Colors.white,
//                           ),
//                     )),
//         ),
//       ),
//     );
//   }
// }
