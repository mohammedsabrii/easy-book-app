import 'package:asay_book_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCaseNoParam<Type> {
  Future<Either<Failure, Type>> call();
}
