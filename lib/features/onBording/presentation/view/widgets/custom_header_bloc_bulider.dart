import 'package:asay_book_app/core/widgets/custom_logo.dart';
import 'package:asay_book_app/features/onBording/presentation/manger/cubit/onbording_cubit.dart';
import 'package:asay_book_app/features/onBording/presentation/view/widgets/custom_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomHeaderBlocBulider extends StatelessWidget {
  const CustomHeaderBlocBulider({
    super.key,
    required this.pageIndex,
  });

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnbordingCubit, OnbordingState>(
        builder: (context, state) {
      if (pageIndex == 2) {
        return const CustomLogo();
      } else {
        return const CustomHeader();
      }
    });
  }
}
