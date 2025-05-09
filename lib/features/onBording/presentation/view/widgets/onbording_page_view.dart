import 'package:asay_book_app/core/utils/app_styles.dart';
import 'package:asay_book_app/features/onBording/presentation/data/static.dart';
import 'package:flutter/material.dart';

class OnbordingPageView extends StatelessWidget {
  const OnbordingPageView({
    super.key,
    required this.pageController,
  });
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: onBordingList.length,
      itemBuilder: (context, index) => Column(
        children: [
          Image.asset(
            onBordingList[index].image,
            height: MediaQuery.sizeOf(context).height * .529,
            width: MediaQuery.sizeOf(context).width,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            textAlign: TextAlign.center,
            onBordingList[index].title,
            style: AppStyles.styleBold24(context),
          ),
          Text(
            textAlign: TextAlign.center,
            onBordingList[index].body,
            style: AppStyles.styleReglur14(context),
          ),
        ],
      ),
    );
  }
}
