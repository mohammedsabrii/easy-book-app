// ignore_for_file: use_build_context_synchronously

import 'package:asay_book_app/core/utils/app_router.dart';
import 'package:asay_book_app/core/utils/app_styles.dart';
import 'package:asay_book_app/core/utils/assets_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashViewbody extends StatefulWidget {
  const SplashViewbody({super.key});

  @override
  State<SplashViewbody> createState() => _SplashViewbodyState();
}

class _SplashViewbodyState extends State<SplashViewbody> {
  @override
  void initState() {
    super.initState();

    navigateToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return const WeatherLogo();
  }

  void navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (isFirstTime) {
      await prefs.setBool('isFirstTime', false);
      GoRouter.of(context).pushReplacement(AppRouter.kOnBordingView);
      return;
    }

    User? user = FirebaseAuth.instance.currentUser;
    bool? isLoggedIn = prefs.getBool('isLoggedIn');

    if (user != null && isLoggedIn == true) {
      GoRouter.of(context).pushReplacement(AppRouter.khomeView);
    } else {
      GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
    }
  }
}

class WeatherLogo extends StatelessWidget {
  const WeatherLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Stack(children: [
        SvgPicture.asset(
          AssetsApp.kBackGroudImage,
          fit: BoxFit.fill,
        ),
        Positioned(
            top: MediaQuery.sizeOf(context).height * .43,
            bottom: MediaQuery.sizeOf(context).height * .43,
            right: MediaQuery.sizeOf(context).width * .34,
            left: MediaQuery.sizeOf(context).width * .34,
            child: Column(
              children: [
                Image.asset(
                  AssetsApp.kLogo,
                  fit: BoxFit.fill,
                  height: MediaQuery.sizeOf(context).height * .09,
                  width: MediaQuery.sizeOf(context).width * .22,
                ),
                Text(
                  'Easy Book',
                  style: AppStyles.styleBold14(context)
                      .copyWith(color: Colors.white, fontSize: 25),
                )
              ],
            ))
      ]),
    );
  }
}
