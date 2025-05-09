import 'package:asay_book_app/core/utils/app_colors.dart';
import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
import 'package:asay_book_app/features/home/presentation/manger/cubits/popular_books_cubit/popular_books_cubit.dart';
import 'package:asay_book_app/core/widgets/custom_gride_view_bulider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GridViewBlocConsumer extends StatefulWidget {
  const GridViewBlocConsumer({super.key});

  @override
  State<GridViewBlocConsumer> createState() => _GridViewBlocConsumerState();
}

class _GridViewBlocConsumerState extends State<GridViewBlocConsumer> {
  final List<BookEntity> book = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PopularBooksCubit, PopularBooksState>(
      listener: (context, state) {
        if (state is PopularBooksSuccess) {
          book.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is PopularBooksSuccess ||
            state is PopularBooksPaginationLoading) {
          return CustomGridViewBuilder(books: book);
        } else if (state is PopularBooksFailure) {
          return SliverToBoxAdapter(
              child: Center(child: Text(state.errorMassage)));
        } else {
          return const SliverToBoxAdapter(
            child: Center(
                child: CircularProgressIndicator(
              color: AppColors.kOrangColor,
            )),
          );
        }
      },
    );
  }
}
