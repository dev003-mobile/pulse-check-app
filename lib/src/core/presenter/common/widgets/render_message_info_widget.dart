import 'package:flutter/material.dart';

import '../design/app_style_design.dart';
import '../design/app_theme_design.dart';

class RenderMessageInfo {
  static render({
    Color? color,
    Color? fontColor,
    Duration? duration,
    required double size,
    required String message,
    SnackBarBehavior? behavior, 
    Animation<double>? animation,
    required BuildContext context, 
    SnackBarAction? snackBarAction,
    DismissDirection? dismissDirection,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: behavior,
      dismissDirection: dismissDirection ?? DismissDirection.horizontal,
      backgroundColor: color ?? AppThemeDesign.defaulTheme.colorScheme.error,
      duration: duration ?? const Duration(seconds: 2),
      action: snackBarAction,
      animation: animation,
      content: Text(
        message,  
        textAlign: TextAlign.center,
        style: AppStyleDesign.fontStyleInter(
          size: size,
          context: context,
          fontWeight: FontWeight.w500,
          color: fontColor ?? AppThemeDesign.defaulTheme.colorScheme.surface,
        )
      )
    ));
  }
}