part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchSaccess extends SearchState {
  final List<BookEntity> book;

  SearchSaccess({required this.book});
}

final class SearchLoading extends SearchState {}

final class SearchPagnationLoading extends SearchState {
  // final List<BookEntity> currentBooks;

  // SearchPagnationLoading({required this.currentBooks});
}

final class SearchFailure extends SearchState {
  final String errorMassage;

  SearchFailure({required this.errorMassage});
}

final class SearchStart extends SearchState {}
