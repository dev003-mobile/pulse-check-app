import 'package:flutter/material.dart';

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
    color: color,
    height: height,
    fontSize: size,
    fontFamily: "Inter",
    fontWeight: fontWeight,
    decoration: decoration,
    letterSpacing: letterSpacing
  );
}