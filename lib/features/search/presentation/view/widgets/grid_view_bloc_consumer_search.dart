// import 'package:asay_book_app/core/utils/app_router.dart';
// import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
// import 'package:asay_book_app/features/home/presentation/manger/cubits/popular_books_cubit/popular_books_cubit.dart';
// import 'package:asay_book_app/features/home/presentation/view/widgets/item_detiles.dart';
// import 'package:asay_book_app/features/home/presentation/view/widgets/popular_book_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';

// class GridSearchViewBlocConsumer extends StatelessWidget {
//   GridSearchViewBlocConsumer({super.key});

//   final List<BookEntity> book = [];

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<PopularBooksCubit, PopularBooksState>(
//       builder: (context, state) {
//         if (state is PopularBooksSuccess) {
//           return CustomSearchGridViewBuilder(
//             books: book,
//           );
//         } else if (state is PopularBooksFailure) {
//           return Text(state.errorMassage);
//         } else {
//           return const CircularProgressIndicator();
//         }
//       },
//     );
//   }
// }

// class CustomSearchGridViewBuilder extends StatefulWidget {
//   const CustomSearchGridViewBuilder({super.key, required this.books});
//   final List<BookEntity> books;

//   @override
//   State<CustomSearchGridViewBuilder> createState() =>
//       _CustomSearchGridViewBuilderState();
// }

// class _CustomSearchGridViewBuilderState
//     extends State<CustomSearchGridViewBuilder> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//         height: MediaQuery.of(context).size.height * 0.6,
//         child: GridView.builder(
//           // physics: const NeverScrollableScrollPhysics(),

//           itemCount: widget.books.length,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             mainAxisSpacing: 100,
//             crossAxisSpacing: 10,
//           ),
//           itemBuilder: (context, index) {
//             return SingleChildScrollView(
//               physics: const NeverScrollableScrollPhysics(),
//               clipBehavior: Clip.none,
//               child: GestureDetector(
//                 onTap: () {
//                   GoRouter.of(context)
//                       .push(AppRouter.kDetailsView, extra: widget.books[index]);
//                 },
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: MediaQuery.sizeOf(context).height * 0.145,
//                     ),
//                     Stack(
//                       clipBehavior: Clip.none,
//                       children: [
//                         ItemDetiles(book: widget.books[index]),
//                         Positioned(
//                             top: -125,
//                             child:
//                                 PopularBooksImage(book: widget.books[index])),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ));
//   }
// }
