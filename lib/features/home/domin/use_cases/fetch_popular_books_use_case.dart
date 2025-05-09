import 'package:asay_book_app/core/errors/failure.dart';
import 'package:asay_book_app/core/use_cases/use_case.dart';
import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
import 'package:asay_book_app/features/home/domin/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchPopularBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchPopularBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call({int pram = 0}) async {
    return await homeRepo.fetchPopularBooks(pageNumber: pram);
  }
}
