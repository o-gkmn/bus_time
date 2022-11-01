import 'package:flutter/material.dart';

class CustomTheme {
  CustomTheme._();

  static const Color _lightScaffoldBackgroundColor = Color(0xFFFCFFB2);
  static const Color _lightPrimaryColor = Color(0xfff7d101);
  static const Color _lightIconThemeColor = Color(0xff8DABAE);
  static const Color _lightMediumLabelTextColor = Color(0xff000000);

  static const mediumLabelTextStyle =
      TextStyle(color: _lightMediumLabelTextColor);

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: _lightScaffoldBackgroundColor,
      primaryColor: _lightPrimaryColor,
      iconTheme: const IconThemeData(color: _lightIconThemeColor, size: 25.0),
      textTheme: const TextTheme(labelMedium: mediumLabelTextStyle));
}
