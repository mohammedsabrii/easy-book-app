import 'package:asay_book_app/core/utils/app_styles.dart';
import 'package:asay_book_app/features/home/presentation/view/widgets/grid_view_bloc_consumer.dart';
import 'package:asay_book_app/features/search/presentation/view/widgets/custom_text_fild.dart';
import 'package:flutter/material.dart';

class StartPageScrollView extends StatelessWidget {
  const StartPageScrollView({super.key, required this.scrollController});
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const CustomTextFild(),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Popular books',
                  style: AppStyles.styleBold20(context),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          const GridViewBlocConsumer(),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 80,
            ),
          )
        ],
      ),
    );
  }
}
