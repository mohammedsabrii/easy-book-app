import 'package:asay_book_app/core/errors/failure.dart';
import 'package:asay_book_app/core/use_cases/use_case.dart';
import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
import 'package:asay_book_app/features/home/domin/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchCategoryResaultUseCase
    extends CategoryUseCase<List<BookEntity>, String, int> {
  final HomeRepo homeRepo;

  FetchCategoryResaultUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call(
      {required String pram, int pageNumber = 0}) async {
    return await homeRepo.fetchCategoryResult(
        title: pram, pageNumber: pageNumber);
  }
}
