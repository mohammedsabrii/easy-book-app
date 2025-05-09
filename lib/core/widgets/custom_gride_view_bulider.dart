import 'package:asay_book_app/core/utils/app_router.dart';
import 'package:asay_book_app/core/widgets/custom_favorite_button.dart';
import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
import 'package:asay_book_app/features/home/presentation/view/widgets/item_detiles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';

class CustomGridViewBuilder extends StatefulWidget {
  const CustomGridViewBuilder({super.key, required this.books});
  final List<BookEntity> books;

  @override
  State<CustomGridViewBuilder> createState() => _CustomGridViewBuilderState();
}

class _CustomGridViewBuilderState extends State<CustomGridViewBuilder> {
  @override
  Widget build(BuildContext context) {
    final favoritesBox = Hive.box<BookEntity>('favorites');

    return ValueListenableBuilder(
      valueListenable: favoritesBox.listenable(),
      builder: (context, Box<BookEntity> favorites, _) {
        return SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 70,
            crossAxisSpacing: 10,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final books = widget.books[index];
              final isFav = favorites.get(books.bookId) != null;

              return SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                clipBehavior: Clip.none,
                child: Stack(children: [
                  GestureDetector(
                      onTap: () {
                        GoRouter.of(context)
                            .push(AppRouter.kDetailsView, extra: books);
                      },
                      child: ItemWidget(book: books)),
                  Positioned(
                    right: 20,
                    top: 10,
                    child:
                        customFavoriteButton(context, isFav, favorites, books),
                  )
                ]),
              );
            },
            childCount: widget.books.length,
          ),
        );
      },
    );
  }
}
