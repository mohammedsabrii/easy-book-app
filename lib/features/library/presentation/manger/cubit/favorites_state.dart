part of 'favorites_cubit.dart';

@immutable
sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesLoading extends FavoritesState {}

final class FavoritesSuccess extends FavoritesState {
  final List<BookEntity> book;

  FavoritesSuccess({required this.book});
}

final class FavoritesFaliuer extends FavoritesState {
  final String errorMassage;

  FavoritesFaliuer({required this.errorMassage});
}
