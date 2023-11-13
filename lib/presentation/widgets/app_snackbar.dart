import 'package:flutter/material.dart';

///App snackbar
class AppSnackbar {
  /// Shows the snackbar. Takes the current context, a message and an isFailure 
  /// boolean. If true, shows an error snackbar with a redAccent else it shows 
  /// one with a green background.
  static void show(
    BuildContext context,
    String message,
    bool isFailure,
  ) {
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
