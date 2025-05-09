import 'package:asay_book_app/core/utils/app_colors.dart';
import 'package:asay_book_app/core/utils/app_styles.dart';
import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
import 'package:asay_book_app/features/search/presentation/manger/search_cubit/search_cubit.dart';
import 'package:asay_book_app/features/search/presentation/view/widgets/result_view.dart';
import 'package:asay_book_app/features/search/presentation/view/widgets/start_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBlocBuilder extends StatefulWidget {
  const SearchBlocBuilder({super.key});

  @override
  State<SearchBlocBuilder> createState() => _SearchBlocBuilderState();
}

class _SearchBlocBuilderState extends State<SearchBlocBuilder> {
final List<BookEntity> book = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener:  (context, state) {
        if (state is SearchSaccess) {
          book.addAll(state.book);
        }
      },
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(
              child: CircularProgressIndicator(
            color: AppColors.kOrangColor,
          ));
        } else if (state is SearchFailure) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              state.errorMassage,
              textAlign: TextAlign.center,
              style: AppStyles.styleReglur16(context)
                  .copyWith(color: Colors.white),
            ),
          );
        } else if (state is SearchSaccess|| state is SearchPagnationLoading) {
          return ResultView(book: book);
        }  else {
          return const StartPageView();
        }
      },
    );
  }
}
