import 'package:flutter/material.dart';

///App snackbar
class AppSnackbar {
  static show(BuildContext context, String message, bool isFailure) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: Colors.white),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: isFailure ? Colors.redAccent : Colors.green,
      showCloseIcon: true,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
