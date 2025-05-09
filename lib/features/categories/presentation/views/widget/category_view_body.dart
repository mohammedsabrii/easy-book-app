import 'package:asay_book_app/core/utils/app_colors.dart';
import 'package:asay_book_app/core/widgets/custm_app_bar.dart';
import 'package:asay_book_app/features/categories/presentation/manger/cubit/category_cubit/category_cubit.dart';
import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
import 'package:asay_book_app/core/widgets/custom_gride_view_bulider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryViewBody extends StatefulWidget {
  const CategoryViewBody({super.key, required this.catgoryName});
  final String catgoryName;

  @override
  State<CategoryViewBody> createState() => _CategoryViewBodyState();
}

class _CategoryViewBodyState extends State<CategoryViewBody> {
  final List<BookEntity> books = [];
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
    BlocProvider.of<CategoryCubit>(context).featchCategoryResult(
      title: widget.catgoryName,
    );
  }

  void scrollListener() async {
    var currentPositions = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;

    if (currentPositions >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;

        await BlocProvider.of<CategoryCubit>(context).featchCategoryResult(
            title: widget.catgoryName, pageNumber: nextPage);
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
    return Column(
      children: [
        CustomAppBar(title: widget.catgoryName),
        Expanded(
          child: BlocConsumer<CategoryCubit, CategoryState>(
            listener: (context, state) {
              if (state is CategorySaccess) {
                setState(() {
                  for (var book in state.book) {
                    if (!books.contains(book)) {
                      books.add(book);
                    }
                  }
                  nextPage++;
                });
              }
            },
            builder: (context, state) {
              if (state is CategoryFailure) {
                return Center(child: Text(state.errorMassage));
              } else if (state is CategorySaccess ||
                  state is CategoryPaginationLoading) {
                return CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    CustomGridViewBuilder(
                      books: books,
                    ),
                    const SliverToBoxAdapter(child: SizedBox(height: 85)),
                  ],
                );
              } else {
                return const Center(
                  child:
                      CircularProgressIndicator(color: AppColors.kOrangColor),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
