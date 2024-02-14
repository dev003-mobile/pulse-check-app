import 'package:flutter/material.dart';

import '../design/app_style_design.dart';
import '../design/app_theme_design.dart';

class RenderMessageInfo {
  static render({
    required BuildContext context, 
    Color? color,
    Color? fontColor,
    required double size,
    Duration? duration,
    DismissDirection? dismissDirection, 
    SnackBarAction? snackBarAction,
    Animation<double>? animation,
    required String message
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
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