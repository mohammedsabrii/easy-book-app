import 'package:asay_book_app/features/onBording/presentation/view/widgets/custom_header_bloc_bulider.dart';
import 'package:asay_book_app/features/onBording/presentation/view/widgets/custom_indcetor_bloc_builder.dart';
import 'package:asay_book_app/features/onBording/presentation/view/widgets/onbording_page_view.dart';
import 'package:flutter/material.dart';

class OnbordingBody extends StatefulWidget {
  const OnbordingBody({super.key});

  @override
  State<OnbordingBody> createState() => _OnbordingBodyState();
}

class _OnbordingBodyState extends State<OnbordingBody> {
  late PageController pageController;
  int pageIndex = 0;
  @override
  void initState() {
    pageController = PageController();

    pageController.addListener(() {
      pageIndex = pageController.page!.round();
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomHeaderBlocBulider(pageIndex: pageIndex),
            Expanded(
              child: OnbordingPageView(
                pageController: pageController,
              ),
            ),
            CustomIndcetorBlocBuilder(pageIndex: pageIndex),
          ],
        ),
      ),
    );
  }
}
