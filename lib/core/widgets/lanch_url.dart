import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUr(context, String? url) async {
  if (url != null) {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      SnackBar snackBar = SnackBar(content: Text('Cannot launch $url'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
