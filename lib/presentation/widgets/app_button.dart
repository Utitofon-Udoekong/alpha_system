import 'package:flutter/material.dart';

/// AppButton. Receives a text, disabled state an tap event as parameters.
class AppButton extends StatelessWidget {
  /// Constructor for the custom filled button
  const AppButton(
      {required this.title,
      required this.onTap,
      required this.disabled,
      super.key});

  /// Title of the button
  final String title;

  /// Disabled state of the button.
  final bool disabled;

  /// Receives tap functions on the button
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      onPressed: disabled ? null : onTap,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black),
          side: const MaterialStatePropertyAll(BorderSide.none),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          fixedSize: MaterialStatePropertyAll(
              Size(MediaQuery.of(context).size.width, 45)),
          maximumSize: const MaterialStatePropertyAll(Size(500, 45))),
      child: Text(
        disabled ? 'loading...' : title,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: Colors.white),
      ),
    ));
  }
}
