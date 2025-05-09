import 'package:asay_book_app/core/utils/app_router.dart';
import 'package:asay_book_app/core/widgets/custm_app_bar.dart';
import 'package:asay_book_app/core/widgets/custom_show_snackbar.dart';
import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
import 'package:asay_book_app/features/library/presentation/view/widgets/custom_favorite_view_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final favoritesBox = Hive.box<BookEntity>('favorites');
    return ValueListenableBuilder(
        valueListenable: favoritesBox.listenable(),
        builder: (context, Box<BookEntity> favorites, _) {
          final favoriteBooks = favorites.values.toList();
          return Column(
            children: [
              const CustomAppBar(title: 'Favorites'),
              favoriteBooks.isEmpty
                  ? const Center(child: Text("No favorites yet"))
                  : Expanded(
                      child: ListView.builder(
                        itemCount: favoriteBooks.length,
                        itemBuilder: (context, index) {
                          final book = favoriteBooks[index];
                          return Padding(
                            padding: const EdgeInsets.all(12),
                            child: Stack(children: [
                              GestureDetector(
                                onTap: () {
                                  GoRouter.of(context).push(
                                    AppRouter.kDetailsView,
                                    extra: book,
                                  );
                                },
                                child: CustomFavoriteViewItem(book: book),
                              ),
                              Positioned(
                                right: 10,
                                child: IconButton(
                                  icon: const Icon(Icons.favorite,
                                      color: Colors.red),
                                  onPressed: () async {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    await favorites.delete(book.bookId);
                                    customShowSnackBar(context,
                                        title: 'Removed from Favorites');
                                  },
                                ),
                              )
                            ]),
                          );
                        },
                      ),
                    ),
            ],
          );
        });
  }
}
