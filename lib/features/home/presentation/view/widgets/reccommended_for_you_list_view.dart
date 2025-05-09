import 'package:asay_book_app/core/utils/app_router.dart';
import 'package:asay_book_app/core/widgets/custom_favorite_button.dart';
import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
import 'package:asay_book_app/features/home/presentation/manger/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'package:asay_book_app/features/home/presentation/view/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';

class RecommededForYouListView extends StatefulWidget {
  const RecommededForYouListView({
    super.key,
    required this.books,
  });

  final List<BookEntity> books;

  @override
  RecommededForYouListViewState createState() =>
      RecommededForYouListViewState();
}

class RecommededForYouListViewState extends State<RecommededForYouListView> {
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

        await BlocProvider.of<FeaturedBooksCubit>(context)
            .fetchFeaturedBooks(pageNumber: nextPage);
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
    final favoritesBox = Hive.box<BookEntity>('favorites');
    return ValueListenableBuilder(
        valueListenable: favoritesBox.listenable(),
        builder: (context, Box<BookEntity> favorites, _) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.20,
            child: ListView.builder(
              controller: _scrollController,
              itemCount: widget.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final books = widget.books[index];
                final isFav = favorites.get(books.bookId) != null;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Stack(children: [
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kDetailsView,
                            extra: widget.books[index]);
                      },
                      child: CustomBookItem(
                        image: widget.books[index].image ?? '',
                      ),
                    ),
                    Positioned(
                        right: 12,
                        top: 5,
                        child: customFavoriteButton(
                            context, isFav, favorites, books))
                  ]),
                );
              },
            ),
          );
        });
  }
}
