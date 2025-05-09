import 'package:asay_book_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call({required Param pram});
}

abstract class CategoryUseCase<Type, Param, PageNumber> {
  Future<Either<Failure, Type>> call(
      {required Param pram, PageNumber pageNumber});
}
