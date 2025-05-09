part of 'popular_books_cubit.dart';

@immutable
sealed class PopularBooksState {}

final class PopularBooksInitial extends PopularBooksState {}

final class PopularBooksLoading extends PopularBooksState {}

final class PopularBooksPaginationLoading extends PopularBooksState {}

final class PopularBooksSuccess extends PopularBooksState {
  final List<BookEntity> books;

  PopularBooksSuccess(this.books);
}

final class PopularBooksFailure extends PopularBooksState {
  final String errorMassage;

  PopularBooksFailure(this.errorMassage);
}
