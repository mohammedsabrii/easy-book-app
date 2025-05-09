// ignore_for_file: use_build_context_synchronously

import 'package:asay_book_app/core/utils/app_router.dart';
import 'package:asay_book_app/core/widgets/custom_show_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(RegisterAuthInitial());
  Future<void> logInUser(BuildContext context,
      {required String email, required String password}) async {
    emit(LogInAuthLoading());
    try {
      var auth = FirebaseAuth.instance;
      // ignore: unused_local_variable
      final UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      emit(LogInAuthSuccess());

      customShowSnackBar(context, title: 'Success');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        customShowSnackBar(context, title: 'User not Found');
        emit(LogInAuthFaliuer(erorrMassage: 'User not Found'));
      } else if (e.code == 'wrong-password') {
        customShowSnackBar(context, title: 'wrong-password');
        emit(LogInAuthFaliuer(erorrMassage: 'wrong password'));
      } else if (e.code == 'invalid-credential') {
        emit(LogInAuthFaliuer(erorrMassage: 'invalid credential'));

        customShowSnackBar(context, title: 'invalid credential');
      } else if (e.code == 'invalid-email') {
        emit(LogInAuthFaliuer(erorrMassage: 'invalid email'));
        customShowSnackBar(context, title: 'invalid email');
      } else {
        customShowSnackBar(context, title: e.toString());
        emit(LogInAuthFaliuer(erorrMassage: e.toString()));
      }
    }
  }

  Future<void> registerUser(BuildContext context,
      {required String email,
      required String password,
      required String confirmPassword,
      required String username}) async {
    emit(RegisterAuthLoading());
    if (password != confirmPassword) {
      customShowSnackBar(context, title: 'Passwords do not match.');
      emit(RegisterAuthFaliuer(erorrMassage: 'Passwords do not match.'));
      return;
    }
    emit(RegisterAuthSuccess());
    customShowSnackBar(context, title: 'Success');
    try {
      var auth = FirebaseAuth.instance;
      UserCredential user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.user!.uid)
          .set({
        'username': username,
        'email': email,
        'uid': user.user!.uid,
      });

      emit(RegisterAuthSuccess());

      customShowSnackBar(context, title: 'Success');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        customShowSnackBar(context,
            title: 'The password provided is too weak.');
        emit(RegisterAuthFaliuer(
            erorrMassage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        customShowSnackBar(context,
            title: 'The account already exists for that email.');
        emit(RegisterAuthFaliuer(erorrMassage: 'email-already-in-use'));
      }
    } catch (e) {
      customShowSnackBar(context, title: e.toString());
      emit(RegisterAuthFaliuer(erorrMassage: e.toString()));
    }
  }

  Future signInWithGoogle(BuildContext context) async {
    emit(LogInAuthLoading());
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      emit(LogInAuthSuccess());
      customShowSnackBar(context, title: 'Success');

      GoRouter.of(context).pushReplacement(AppRouter.khomeView);
    } on FirebaseAuthException catch (e) {
      emit(LogInAuthFaliuer(erorrMassage: e.toString()));
      customShowSnackBar(context,
          title: 'Something went wrong, try again later.');
    }
  }
}
