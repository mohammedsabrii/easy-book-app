import 'package:asay_book_app/core/utils/app_colors.dart';
import 'package:asay_book_app/core/utils/app_styles.dart';
import 'package:asay_book_app/features/search/presentation/manger/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextFild extends StatefulWidget {
  const CustomTextFild({
    super.key,
  });

  @override
  State<CustomTextFild> createState() => _CustomTextFildState();
}

class _CustomTextFildState extends State<CustomTextFild> {
  String? title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        style: AppStyles.styleReglur14(context).copyWith(color: Colors.white),
        onChanged: (value) {
          title = value;
        },
        onSubmitted: (value) {
          title = value;
          BlocProvider.of<SearchCubit>(context).fetchSearchResault(
            title: title!,
          );
          setState(() {});
        },
        cursorColor: Colors.white,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: outLineInputBorder(color: AppColors.kSecondColor),
          focusedBorder: outLineInputBorder(color: Colors.white),
          suffixIcon: const Icon(
            Icons.search,
          ),
          labelText: ' Search ',
          labelStyle:
              AppStyles.styleReglur14(context).copyWith(color: Colors.white),
        ),
      ),
    );
  }

  OutlineInputBorder outLineInputBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color),
      gapPadding: 12,
    );
  }
}
