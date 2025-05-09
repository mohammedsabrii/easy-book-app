import 'package:asay_book_app/core/utils/app_router.dart';
import 'package:asay_book_app/core/widgets/custom_butom.dart';
import 'package:asay_book_app/features/onBording/presentation/manger/cubit/onbording_cubit.dart';
import 'package:asay_book_app/features/onBording/presentation/view/widgets/custom_indcetor_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomIndcetorBlocBuilder extends StatelessWidget {
  const CustomIndcetorBlocBuilder({
    super.key,
    required this.pageIndex,
  });

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<OnbordingCubit, OnbordingState>(
        builder: (context, state) {
          if (pageIndex == 2) {
            return Column(
              children: [
                CustomButom(
                    onTap: () {
                      GoRouter.of(context).go(AppRouter.kLoginView);
                    },
                    title: 'Get Startd '),
              ],
            );
          } else {
            return CustomIndcetorList(
              cruntPageIndex: pageIndex,
            );
          }
        },
      ),
    );
  }
}
