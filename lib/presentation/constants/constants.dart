import 'package:flutter/material.dart';
///Hive box name for authentication
const encAuthBox = 'auth_box_enc';
const encPassword = 'auth_box_enc_password';
const encUserName = 'auth_box_enc_username';
const encAuthBoxKey = 'auth_box_enc_key';
const farmInventoryBox = 'farm_inventory_box';

/// Constant Title Text. FontSize - 28px
TextStyle titleText = const TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

/// Constant body Text. Fontsize - 16px
TextStyle bodyText = const TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.normal,
  color: Colors.black,
);

/// Constant input Text. Fontsize - 16px
TextStyle inputText = const TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.normal,
  color: Colors.black,
);

/// Default input decoration
InputDecoration kInputDecoration = const InputDecoration(
  filled: true,
  fillColor: Colors.white,
  border: InputBorder.none,
);

/// Image constant class
class Images{
  /// app logo address
  static const logo = 'images/alpha.png';
}
