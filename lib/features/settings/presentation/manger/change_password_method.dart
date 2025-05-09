// ignore_for_file: use_build_context_synchronously

import 'package:asay_book_app/core/utils/app_router.dart';
import 'package:asay_book_app/core/widgets/custom_show_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<void> changePasswordMethod(BuildContext context,
    {required String password, newPassword}) async {
  try {
    var user = FirebaseAuth.instance.currentUser!;
    String? email = user.email;

    AuthCredential credential = EmailAuthProvider.credential(
      email: email!,
      password: password,
    );
    await user.reauthenticateWithCredential(credential);

    await user.updatePassword(newPassword);
    await user.reload();
    await FirebaseAuth.instance.signOut();
    GoRouter.of(context).go(AppRouter.kLoginView);
    customShowSnackBar(context, title: 'Success ,reauthenticate.');
  } on FirebaseAuthException catch (e) {
    customShowSnackBar(context, title: e.toString());
  }
}
