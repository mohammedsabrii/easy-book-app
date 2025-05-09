import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
import 'package:asay_book_app/features/home/presentation/view/widgets/book_description.dart';
import 'package:asay_book_app/features/home/presentation/view/widgets/book_details_header.dart';
import 'package:asay_book_app/features/home/presentation/view/widgets/book_information.dart';
import 'package:flutter/material.dart';

class DetailsBookViewBody extends StatelessWidget {
  const DetailsBookViewBody({
    super.key,
    required this.bookEntity,
  });
  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Stack(clipBehavior: Clip.none, children: [
            BookDetailsHeader(
              book: bookEntity,
            ),
            Positioned(
                top: MediaQuery.sizeOf(context).height * 0.567,
                right: MediaQuery.sizeOf(context).width * 0.17,
                left: MediaQuery.sizeOf(context).width * 0.17,
                child: BookInFormation(
                  bookEintity: bookEntity,
                )),
          ]),
          BookDescription(
            book: bookEntity,
          )
        ],
      ),
    ));
  }
}
