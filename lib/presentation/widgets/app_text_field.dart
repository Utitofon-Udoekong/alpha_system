import 'package:flutter/material.dart';

/// Custom TextField widget. Receives a title and an onchanged handler
class AppTextField extends StatelessWidget {
  /// Constructor
  const AppTextField({
    required this.title,
    this.obscureText = false,
    this.isPasswordField = false,
    super.key,
    this.onChanged,
    this.toggleVisibility,
    this.textInputAction,
  });

  /// Function which receives typing events and returns the keyed value
  final void Function(String)? onChanged;

  /// Title of the custom widget
  final String title;

  /// If true text's will be obscured in the textfield ui
  final bool? obscureText;

  /// If true the textfield will be treated as a password field
  final bool? isPasswordField;

  /// Changes the visibility state of the widgets text
  final void Function()? toggleVisibility;

  ///Specifies the text input action can be done or next.
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: textInputAction,
      decoration: InputDecoration(
        hintText: title,
        filled: true,
        fillColor: Colors.blueGrey.withOpacity(0.3),
        border: InputBorder.none,
        suffixIcon: isPasswordField!
            ? InkWell(
                onTap: toggleVisibility,
                child: obscureText!
                    ? const Icon(
                        Icons.visibility_outlined,
                        color: Colors.black,
                      )
                    : const Icon(
                        Icons.visibility_off_outlined,
                        color: Colors.black,
                      ),
              )
            : null,
      ),
      obscureText: obscureText!,
      style: Theme.of(context).textTheme.bodyLarge,
      onChanged: onChanged,
    );
  }
}

/// Custom Dropdown form field widget. Receives a title, dropdown items and an onchanged handler
class AppDropDownField extends StatelessWidget {
  /// Constructor
  const AppDropDownField({
    required this.title,
    required this.items,
    required this.value,
    this.onChanged, 
    super.key,
  });

  /// currently selected value
  final dynamic value;

  /// Items to show in drop down
  final List<DropdownMenuItem<dynamic>> items;

  /// Function which receives typing events and returns the keyed value
  final void Function(dynamic)? onChanged;

  /// Title of the custom widget
  final String title;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      // elevation: 8,
      value: value,
      items: items,
      decoration: InputDecoration(
        hintText: title,
        filled: true,
        fillColor: Colors.blueGrey.withOpacity(0.3),
        border: InputBorder.none,
      ),
      style: Theme.of(context).textTheme.bodyLarge,
      onChanged: onChanged,
    );
  }
}
