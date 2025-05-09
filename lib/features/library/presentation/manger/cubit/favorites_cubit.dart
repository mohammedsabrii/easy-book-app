import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
import 'package:asay_book_app/features/home/domin/use_cases/fetch_favorite_result_use_case.dart';
import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit(this.favoriteResultUseCase) : super(FavoritesInitial());
  final FetchFavoriteResultUseCase favoriteResultUseCase;
  Future<void> fetchFavoritesResault({required List<String> title}) async {
    emit(FavoritesLoading());
    var resault = await favoriteResultUseCase.call(pram: title);
    resault.fold(
      (failure) {
        emit(FavoritesFaliuer(errorMassage: failure.message));
      },
      (book) {
        emit(FavoritesSuccess(book: book));
      },
    );
  }
}
