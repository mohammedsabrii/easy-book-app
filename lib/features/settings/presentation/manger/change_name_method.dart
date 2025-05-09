// ignore_for_file: use_build_context_synchronously

import 'package:asay_book_app/core/widgets/custom_show_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> changeNameMethod(BuildContext context,
    {required String userName, password}) async {
  try {
    var user = FirebaseAuth.instance.currentUser!;
    String? email = user.email;

    EmailAuthProvider.credential(
      email: email!,
      password: password,
    );
    await FirebaseAuth.instance.currentUser!.updateDisplayName(userName);
    customShowSnackBar(context, title: 'Success');
  } catch (e) {
    customShowSnackBar(context, title: 'something went wrong please try again');
  }
}
