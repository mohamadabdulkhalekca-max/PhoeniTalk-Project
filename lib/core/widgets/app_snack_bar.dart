import 'package:flutter/material.dart';

snackBar({required String text, required BuildContext context}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(behavior: SnackBarBehavior.floating, content: Text(text)),
  );
}
