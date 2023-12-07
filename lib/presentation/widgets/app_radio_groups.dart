import 'package:flutter/material.dart';

class AppCheckboxTile extends StatelessWidget {
  const AppCheckboxTile(
      {required this.title, required this.value, super.key, this.onChanged,});

  final String title;
  final bool value;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile.adaptive(
        contentPadding: EdgeInsets.zero,
        value: value,
        onChanged: onChanged,
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      );
  }
}
