import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustemBookDetailsAppPar extends StatelessWidget {
  const CustemBookDetailsAppPar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(
              Icons.close,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}
