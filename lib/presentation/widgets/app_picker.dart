import 'package:alpha_system/presentation/constants/constants.dart';
import 'package:flutter/material.dart';

/// AppImage Cpicker custom widget
class AppPicker extends StatelessWidget {
  /// constructor
  const AppPicker({required this.title, super.key, this.onTap});

  /// Title of the picker
  final String title;
  /// Custom function to perform actions
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        color: kPrimaryColor,
        child: Text(title, style: Theme.of(context).textTheme.bodyLarge),
      ),
    );
  }
}
