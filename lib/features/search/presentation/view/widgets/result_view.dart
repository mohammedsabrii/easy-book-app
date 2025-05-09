import 'package:asay_book_app/core/utils/app_styles.dart';
import 'package:asay_book_app/core/widgets/custm_app_bar.dart';
import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
import 'package:asay_book_app/core/widgets/custom_gride_view_bulider.dart';
import 'package:asay_book_app/features/search/presentation/manger/search_cubit/search_cubit.dart';
import 'package:asay_book_app/features/search/presentation/view/widgets/custom_text_fild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultView extends StatefulWidget {
  const ResultView({super.key, required this.book, this.isPaginating = false});
  final List<BookEntity> book;
  final bool isPaginating;

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  late ScrollController _scrollController;
  int currentPage = 1;
  bool isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 100 &&
        !isLoadingMore) {
      _loadMoreBooks();
    }
  }

  void _loadMoreBooks() {
    setState(() {
      isLoadingMore = true;
    });

    final searchCubit = BlocProvider.of<SearchCubit>(context);

    searchCubit
        .fetchSearchResault(
      title: searchCubit.searchQuery ?? 'default query',
      pageNumber: currentPage + 1,
    )
        .then((_) {
      setState(() {
        currentPage++;
        isLoadingMore = false;
      });
    }).catchError((_) {
      setState(() {
        isLoadingMore = false;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage('assets/images/Vector 1.png'),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              const CustomAppBar(title: 'Search'),
              const SizedBox(height: 10),
              Expanded(
                child: CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomTextFild(),
                          const SizedBox(height: 10),
                          Text(
                            'Result',
                            style: AppStyles.styleBold20(context),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    CustomGridViewBuilder(
                      books: widget.book,
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(height: 80),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
