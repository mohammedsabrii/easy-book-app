import 'package:asay_book_app/core/utils/app_router.dart';
import 'package:asay_book_app/core/widgets/custom_show_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<void> changeEmailMethod(BuildContext context,
    {required String password, newEmail}) async {
  try {
    var user = FirebaseAuth.instance.currentUser!;
    String? email = user.email;

    AuthCredential credential = EmailAuthProvider.credential(
      email: email!,
      password: password,
    );
    await user.reauthenticateWithCredential(credential);

    await user.verifyBeforeUpdateEmail(newEmail!);
    await user.reload();
    await FirebaseAuth.instance.signOut();
    GoRouter.of(context).go(AppRouter.kLoginView);
    customShowSnackBar(context,
        title: 'Success ,Verification your email and re authenticate.');
  } on FirebaseAuthException catch (e) {
    if (e.code == 'wrong-password') {
      customShowSnackBar(context, title: 'wrong-password');
    } else {
      customShowSnackBar(context, title: e.toString());
    }
  }
}
