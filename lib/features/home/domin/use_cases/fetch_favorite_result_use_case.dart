import 'package:asay_book_app/core/errors/failure.dart';
import 'package:asay_book_app/core/use_cases/use_case.dart';
import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
import 'package:asay_book_app/features/home/domin/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchFavoriteResultUseCase
    extends UseCase<List<BookEntity>, List<String>> {
  final HomeRepo homeRepo;
  FetchFavoriteResultUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call(
      {required List<String> pram}) async {
    return await homeRepo.fetchFavoritesBooks(title: pram);
  }
}
