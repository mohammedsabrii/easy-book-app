import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
import 'package:asay_book_app/features/home/domin/use_cases/fetch_category_result_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.fetchSearchResaultUseCase) : super(CategoryInitial());
  final FetchCategoryResaultUseCase fetchSearchResaultUseCase;
  Future<void> featchCategoryResult(
      {required String title, int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(CategoryLoading());
    } else {
      emit(CategoryPaginationLoading());
    }
    var result = await fetchSearchResaultUseCase.call(
        pram: title, pageNumber: pageNumber);
    result.fold(
      (failure) {
        emit(CategoryFailure(errorMassage: failure.message));
      },
      (book) {
        emit(CategorySaccess(book: book));
      },
    );
  }
}
