import 'package:flutter/material.dart';

class CustomDotIdctor extends StatelessWidget {
  const CustomDotIdctor({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: AnimatedContainer(
        height: 10,
        width: isActive ? 37 : 10,
        duration: const Duration(milliseconds: 600),
        decoration: BoxDecoration(
            color: isActive ? const Color(0xFFDE7773) : const Color(0xFF9D9D9D),
            borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}
