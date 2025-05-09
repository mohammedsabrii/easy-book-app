import 'package:asay_book_app/core/utils/app_colors.dart';
import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
import 'package:asay_book_app/features/home/presentation/manger/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'package:asay_book_app/features/home/presentation/view/widgets/reccommended_for_you_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommededForYouBlocBuilder extends StatelessWidget {
  RecommededForYouBlocBuilder({super.key});
  final List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBookspaginationLoading) {
          return RecommededForYouListView(books: books);
        } else if (state is FeaturedBooksFailure) {
          return Text(state.errMessage);
        } else {
          return const Center(
              child: CircularProgressIndicator(
            color: AppColors.kOrangColor,
          ));
        }
      },
    );
  }
}
