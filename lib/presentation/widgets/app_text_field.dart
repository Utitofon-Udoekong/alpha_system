import 'package:alpha_system/presentation/constants/constants.dart';
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
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextField(
        textInputAction: textInputAction,
        decoration: InputDecoration(
          hintText: title,
          filled: true,
          fillColor: kPrimaryColor,
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
      ),
    );
  }
}

/// Custom TextField widget with a text field as label. Receives a title and an onchanged handler
class TextWithAppTextField extends StatelessWidget {
  /// Constructor
  const TextWithAppTextField({
    required this.title,
    this.obscureText = false,
    this.isPasswordField = false,
    super.key,
    this.onChanged,
    this.toggleVisibility,
    this.textInputAction,
    this.hintText,
    this.keyboardType = TextInputType.text,
  });

  /// Function which receives typing events and returns the keyed value
  final void Function(String)? onChanged;

  /// Title of the custom widget
  final String title;

  /// hintText of the custom widget
  final String? hintText;

  /// If true text's will be obscured in the textfield ui
  final bool? obscureText;

  /// If true the textfield will be treated as a password field
  final bool? isPasswordField;

  /// Changes the visibility state of the widgets text
  final void Function()? toggleVisibility;

  ///Specifies the text input action can be done or next.
  final TextInputAction? textInputAction;

  ///Specifies the keyboard type to be used. Defaults to [TextInputType.text].
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        TextField(
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: kPrimaryColor,
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
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}


/// Custom Dropdown form field widget with a textfield and a text widget as a label. Receives a title, dropdown items and an onchanged handler
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
  final List<dynamic> items;

  /// Function which receives typing events and returns the keyed value
  final void Function(dynamic)? onChanged;

  /// Title of the custom widget
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        DropdownButtonFormField(
          isExpanded: true,
          value: value,
          items: items.map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text('$e',overflow: TextOverflow.ellipsis,),
                  ),
                )
                .toList(),
          decoration: InputDecoration(
            hintText: title,
            filled: true,
            fillColor: kPrimaryColor,
            border: InputBorder.none,
          ),
          style: Theme.of(context).textTheme.bodyLarge,
          onChanged: onChanged,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
