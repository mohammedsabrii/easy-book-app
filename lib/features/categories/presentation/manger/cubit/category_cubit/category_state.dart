part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategorySaccess extends CategoryState {
  final List<BookEntity> book;

  CategorySaccess({required this.book});
}

final class CategoryFailure extends CategoryState {
  final String errorMassage;

  CategoryFailure({required this.errorMassage});
}

final class CategoryLoading extends CategoryState {}

final class CategoryPaginationLoading extends CategoryState {}
