import 'package:asay_book_app/core/errors/failure.dart';
import 'package:asay_book_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:asay_book_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
import 'package:asay_book_app/features/home/domin/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pageNumber = 0}) async {
    List<BookEntity> bookList;
    try {
      bookList = homeLocalDataSource.fetchFeaturedBooks(pageNumber: pageNumber);
      if (bookList.isNotEmpty) {
        return right(bookList);
      }
      bookList =
          await homeRemoteDataSource.fetchFeaturedBooks(pageNumber: pageNumber);
      return right(bookList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchPopularBooks(
      {int pageNumber = 0}) async {
    List<BookEntity> bookList;
    bookList = homeLocalDataSource.fetchPopularBooks(pageNumber: pageNumber);
    try {
      if (bookList.isNotEmpty) {
        return right(bookList);
      }
      bookList =
          await homeRemoteDataSource.fetchPopularBooks(pageNumber: pageNumber);
      return right(bookList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFavoritesBooks(
      {required List<String> title}) async {
    List<BookEntity> bookList;
    try {
      bookList = await homeRemoteDataSource.fetchFavoritesBooks(title: title);
      return right(bookList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSearchResault(
      {required String title, int pageNumber = 0}) async {
    List<BookEntity> bookList;
    try {
      bookList = await homeRemoteDataSource.fetchSearchResault(
          title: title, pageNumber: pageNumber);
      return right(bookList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchCategoryResult({
    required String title,
    int pageNumber = 0,
  }) async {
    try {
      List<BookEntity> bookList =
          await homeRemoteDataSource.fetchCategoryResault(
        title: title,
        pageNumber: pageNumber,
      );
      return right(bookList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
