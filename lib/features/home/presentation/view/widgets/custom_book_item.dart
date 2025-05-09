import 'package:flutter/material.dart';

class CustomBookItem extends StatelessWidget {
  const CustomBookItem({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Container(
          height: MediaQuery.sizeOf(context).height * .22,
          width: MediaQuery.of(context).size.width * 0.28,
          decoration: BoxDecoration(
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(16),
          ),
        ));
  }
}
