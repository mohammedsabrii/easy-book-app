
import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
import 'package:asay_book_app/features/home/domin/use_cases/fetch_search_resault_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';


class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.fetchSearchResaultUseCase)
      : super(SearchInitial());
   final FetchSearchResaultUseCase fetchSearchResaultUseCase;
  String? searchQuery;
  Future<void> fetchSearchResault({int pageNumber = 0,required String title,}) async {
    if (pageNumber == 0) {
      searchQuery = title;
      emit(SearchLoading());
    } else {
      emit(SearchPagnationLoading());
    }
    var result = await fetchSearchResaultUseCase.call(pram: title,pageNumber: pageNumber);
    result.fold(
      (failure) {
        emit(SearchFailure(errorMassage:  failure.message));
      },
      (books) {
        emit(SearchSaccess(book:  books));
      },
    );
  }
}