import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
import 'package:asay_book_app/features/home/presentation/view/details_book_view.dart';
import 'package:asay_book_app/features/home/presentation/view/home_view.dart';
import 'package:asay_book_app/features/library/presentation/view/book_mark_view.dart';
import 'package:asay_book_app/features/loginAndRegister/presentation/views/login_view.dart';
import 'package:asay_book_app/features/loginAndRegister/presentation/views/register_view.dart';
import 'package:asay_book_app/features/onBording/presentation/view/onbording_view.dart';
import 'package:asay_book_app/features/search/presentation/view/search_view.dart';
import 'package:asay_book_app/features/settings/presentation/view/change_email_view.dart';
import 'package:asay_book_app/features/settings/presentation/view/change_name_view.dart';
import 'package:asay_book_app/features/settings/presentation/view/change_password_view.dart';
import 'package:asay_book_app/features/settings/presentation/view/settings_view.dart';
import 'package:asay_book_app/features/splash/presentation/view/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const khomeView = '/HomeView';
  static const kOnBordingView = '/OnBordingView';
  static const kBookMarks = '/BookMarks';
  static const ksearchView = '/SearchView';
  static const kDetailsView = '/DetailsView';
  static const kCatgoryView = '/CatgoryView';
  static const kLoginView = '/LoginView';
  static const kRegisterView = '/RegisterView';
  static const kSettingsView = '/SettingsView';
  static const kChangeNameView = '/ChangeNameView';
  static const kChangeEmailView = '/ChangeEmailView';
  static const kChangePasswordView = '/ChangePasswordView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kOnBordingView,
        builder: (context, state) => const OnbordingView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: khomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookMarks,
        builder: (context, state) => const FavoritePage(),
      ),
      GoRoute(
        path: ksearchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: kDetailsView,
        builder: (context, state) => BookDetailsView(
          bookEntity: state.extra as BookEntity,
        ),
      ),
      GoRoute(
        path: kSettingsView,
        builder: (context, state) => SettingsView(),
      ),
      GoRoute(
        path: kChangeNameView,
        builder: (context, state) => ChangeNameView(),
      ),
      GoRoute(
        path: kChangeEmailView,
        builder: (context, state) => ChangeEmailView(),
      ),
      GoRoute(
        path: kChangePasswordView,
        builder: (context, state) => ChangePasswordView(),
      ),
    ],
  );
}
