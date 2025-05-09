import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
import 'package:asay_book_app/features/home/domin/use_cases/fetch_popular_books_use_case.dart';
import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

part 'popular_books_state.dart';

class PopularBooksCubit extends Cubit<PopularBooksState> {
  PopularBooksCubit(this.fetchPopularBooksUseCase)
      : super(PopularBooksInitial());
  final FetchPopularBooksUseCase fetchPopularBooksUseCase;
  Future<void> fetchPopularBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(PopularBooksLoading());
    } else {
      emit(PopularBooksPaginationLoading());
    }
    var result = await fetchPopularBooksUseCase.call(pram: pageNumber);
    result.fold(
      (failure) {
        emit(PopularBooksFailure(failure.message));
      },
      (books) {
        emit(PopularBooksSuccess(books));
      },
    );
  }
}
