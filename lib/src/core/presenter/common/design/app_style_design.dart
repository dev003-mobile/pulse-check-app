import 'package:flutter/material.dart';

import 'app_theme_design.dart';

class AppStyleDesign {
  static TextStyle fontStyleInter({
    required double size,
    Color? color,
    double? height,
    double? letterSpacing,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    required BuildContext context
  }) => TextStyle(
    color: color ?? AppThemeDesign.defaulTheme.colorScheme.surface,
    height: height,
    fontSize: size,
    fontFamily: "Inter",
    fontWeight: fontWeight,
    decoration: decoration,
    letterSpacing: letterSpacing
  );
}