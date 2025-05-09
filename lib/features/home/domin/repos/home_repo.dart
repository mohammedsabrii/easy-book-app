import 'package:asay_book_app/core/errors/failure.dart';
import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pageNumber = 0});
  Future<Either<Failure, List<BookEntity>>> fetchPopularBooks(
      {int pageNumber = 0});

  Future<Either<Failure, List<BookEntity>>> fetchSearchResault(
      {required String title, int pageNumber = 0});
  Future<Either<Failure, List<BookEntity>>> fetchFavoritesBooks(
      {required List<String> title});
  Future<Either<Failure, List<BookEntity>>> fetchCategoryResult(
      {required String title, int pageNumber = 0});
}
