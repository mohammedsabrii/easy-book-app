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

// class FavoriteCubit extends Cubit<List<String>> {
//   FavoriteCubit() : super([]);

//   void toggleFavorite(String bookId) {
//     if (state.contains(bookId)) {
//       emit(state.where((id) => id != bookId).toList());
//     } else {
//       emit([...state, bookId]);
//     }
//   }
// }
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class FavoriteCubit extends Cubit<List<String>> {
//   FavoriteCubit() : super([]) {
//     _loadFavorites();  // Ensure this loads favorites on initialization
//   }
//
//   // Load the saved favorites from SharedPreferences
//   Future<void> _loadFavorites() async {
//     final prefs = await SharedPreferences.getInstance();
//     final savedFavorites = prefs.getStringList('favorites') ?? [];
//     print("Loaded favorites: $savedFavorites"); // Debugging line
//     emit(savedFavorites);
//   }
//
//   // Toggle the favorite status of a book
//   void toggleFavorite(String bookId) {
//     if (state.contains(bookId)) {
//       removeFromFavorites(bookId);
//     } else {
//       addToFavorites(bookId);
//     }
//   }
//
//   // Add a book to the favorites
//   Future<void> addToFavorites(String bookId) async {
//     if (!state.contains(bookId)) {
//       final updatedFavorites = [...state, bookId];
//       emit(updatedFavorites);  // Emit new state
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.setStringList('favorites', updatedFavorites);
//       print("Added to favorites: $updatedFavorites");  // Debugging line
//     }
//   }
//
//   // Remove a book from the favorites
//   Future<void> removeFromFavorites(String bookId) async {
//     final updatedFavorites = state.where((id) => id != bookId).toList();
//     emit(updatedFavorites);  // Emit new state
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setStringList('favorites', updatedFavorites);
//     print("Removed from favorites: $updatedFavorites");  // Debugging line
//   }
//
//   // Check if a book is a favorite
//   bool isFavorite(String bookId) {
//     return state.contains(bookId);
//   }
// }
