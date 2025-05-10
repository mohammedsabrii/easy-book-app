import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
import 'package:bloc/bloc.dart';

class FavoriteButtonCubit extends Cubit<List<BookEntity>> {
  FavoriteButtonCubit() : super([]);

  // Toggle the favorite status of a book
  void toggleFavorite(BookEntity book) {
    if (state.contains(book)) {
      removeFromFavorites(book);
    } else {
      addToFavorites(book);
    }
  }

  void addToFavorites(BookEntity book) {
    if (!state.contains(book)) {
      emit([...state, book]);
    }
  }

  void removeFromFavorites(BookEntity book) {
    emit(state.where((item) => item.bookId != book.bookId).toList());
  }

  bool isFavorite(BookEntity book) {
    return state.contains(book);
  }
}
