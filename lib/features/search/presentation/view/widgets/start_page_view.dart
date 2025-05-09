import 'package:asay_book_app/core/widgets/custm_app_bar.dart';
import 'package:asay_book_app/features/home/presentation/manger/cubits/popular_books_cubit/popular_books_cubit.dart';
import 'package:asay_book_app/features/search/presentation/view/widgets/start_page_scrol_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartPageView extends StatefulWidget {
  const StartPageView({super.key});

  @override
  State<StartPageView> createState() => _StartPageViewState();
}

class _StartPageViewState extends State<StartPageView> {
  late ScrollController _scrollController;

  var nextPage = 1;

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(scrollListener);
    fetchInitialData();
  }

  void fetchInitialData() {
    BlocProvider.of<PopularBooksCubit>(context).fetchPopularBooks();
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const CustomAppBar(
              title: 'Search',
            ),
            const SizedBox(
              height: 10,
            ),
            StartPageScrollView(scrollController: _scrollController)
          ],
        ),
      ),
    );
  }
}
