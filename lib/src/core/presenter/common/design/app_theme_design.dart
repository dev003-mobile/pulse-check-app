import 'package:flutter/material.dart';

class AppThemeDesign {
  static final ThemeData defaulTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    colorScheme:  const ColorScheme.light(
      primary: Color(0xFF1E1E1E),
      error: Color(0xFFE73959),
    )
  );
}