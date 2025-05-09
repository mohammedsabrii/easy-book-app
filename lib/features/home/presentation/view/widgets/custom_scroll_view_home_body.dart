import 'package:asay_book_app/core/utils/app_styles.dart';
import 'package:asay_book_app/features/home/presentation/manger/cubits/popular_books_cubit/popular_books_cubit.dart';
import 'package:asay_book_app/features/home/presentation/view/widgets/grid_view_bloc_consumer.dart';
import 'package:asay_book_app/features/home/presentation/view/widgets/recommended_for_you.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomScrollViewHomeBody extends StatefulWidget {
  const CustomScrollViewHomeBody({super.key});

  @override
  State<CustomScrollViewHomeBody> createState() =>
      _CustomScrollViewHomeBodyState();
}

class _CustomScrollViewHomeBodyState extends State<CustomScrollViewHomeBody> {
  late ScrollController _scrollController;
  var nextPage = 1;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(scrollListener);
  }

  void scrollListener() async {
    var currentPositions = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;

    if (currentPositions >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;

        await BlocProvider.of<PopularBooksCubit>(context)
            .fetchPopularBooks(pageNumber: nextPage);
        nextPage++;
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RecommendedForYou(),
              const SizedBox(height: 8),
              Text(
                'Popular books',
                style: AppStyles.styleBold20(context),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        const GridViewBlocConsumer(),
        const SliverToBoxAdapter(child: SizedBox(height: 85)),
      ],
    );
  }
}
