import 'package:asay_book_app/core/utils/app_router.dart';
import 'package:asay_book_app/core/utils/constens.dart';
import 'package:asay_book_app/core/utils/function/setup_service_locator.dart';
import 'package:asay_book_app/core/utils/simple_bloc_opserer.dart';
import 'package:asay_book_app/features/categories/presentation/manger/cubit/category_cubit/category_cubit.dart';
import 'package:asay_book_app/features/home/data/repos/home_repo_impl.dart';
import 'package:asay_book_app/features/home/data/repos/payment_repo_impl.dart';
import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
import 'package:asay_book_app/features/home/domin/use_cases/fetch_category_result_use_case.dart';
import 'package:asay_book_app/features/home/domin/use_cases/fetch_featured_books_use_case.dart';
import 'package:asay_book_app/features/home/domin/use_cases/fetch_popular_books_use_case.dart';
import 'package:asay_book_app/features/home/domin/use_cases/fetch_search_resault_use_case.dart';
import 'package:asay_book_app/features/home/presentation/manger/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:asay_book_app/features/home/presentation/manger/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'package:asay_book_app/features/home/presentation/manger/cubits/popular_books_cubit/popular_books_cubit.dart';
import 'package:asay_book_app/features/home/presentation/manger/cubits/payment_cubit/payment_cubit.dart';
import 'package:asay_book_app/features/loginAndRegister/presentation/manger/cubit/auth_cubit.dart';
import 'package:asay_book_app/features/onBording/presentation/manger/cubit/onbording_cubit.dart';
import 'package:asay_book_app/features/search/presentation/manger/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  Stripe.publishableKey = kPublishablekey;
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  setupServicLocator();
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  await Hive.openBox<BookEntity>(kSemilerBox);
  await Hive.openBox<BookEntity>('favorites');

  Bloc.observer = SimpleBlocOpserer();

  runApp(
    const BookApp(),
  );
}

class BookApp extends StatelessWidget {
  const BookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // BlocProvider(
        //   create: (context) => PaypalPaymentCubit(),
        // ),
        BlocProvider(
          create: (context) => OnbordingCubit(),
        ),
        BlocProvider(
          create: (context) => FavoriteButtonCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        // BlocProvider(create: (_) => FavoriteCubit()),
        BlocProvider(
          create: (context) {
            return FeaturedBooksCubit(
              FetchFeaturedBooksUseCase(getIt.get<HomeRepoImpl>()),
            )..fetchFeaturedBooks();
          },
        ),
        BlocProvider(
          create: (context) {
            return PopularBooksCubit(
              FetchPopularBooksUseCase(getIt.get<HomeRepoImpl>()),
            )..fetchPopularBooks();
          },
        ),
        BlocProvider(
          create: (context) {
            return SearchCubit(
                FetchSearchResaultUseCase(getIt.get<HomeRepoImpl>()));
          },
        ),
        BlocProvider(
          create: (context) {
            return CategoryCubit(
                FetchCategoryResaultUseCase(getIt.get<HomeRepoImpl>()));
          },
        ),
        BlocProvider(
          create: (context) {
            return PaymentCubit(PaymentRepoImpl());
          },
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
