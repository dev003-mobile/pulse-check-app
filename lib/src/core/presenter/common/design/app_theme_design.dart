import 'package:flutter/material.dart';

class AppThemeDesign {
  static final ThemeData defaulTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    colorScheme:  const ColorScheme.light(
      primary: Color(0XFF9560FF),
      secondary: Color(0XFF440890),
      surface: Color(0XFFFFFFFF),
      background: Color(0XFF000000),
      error: Color(0xFFE73959),
    )
  );
}