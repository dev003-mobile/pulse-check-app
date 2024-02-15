import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../design/app_style_design.dart';
import '../design/app_theme_design.dart';

class TextFieldDefaultWidget extends ConsumerWidget {
  const TextFieldDefaultWidget({
    super.key,
    this.controller,
    this.suffixIcon,
    this.keyboardType,
    this.hintTextColor,
    this.readOnly = false,
    required this.hintText,
    this.obscureText = false,
    this.obscuringCharacter = "•",
  });

  final bool readOnly;
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final Color? hintTextColor;
  final String obscuringCharacter;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.sizeOf(context);
    return  SizedBox(
      child: TextField(
        readOnly: readOnly,
        controller: controller,
        enableSuggestions: true,
        obscureText: obscureText,
        keyboardType: keyboardType,
        cursorOpacityAnimates: true,
        style: AppStyleDesign.fontStyleInter(
          context: context,
          size: size.height * .017,
          fontWeight: FontWeight.w500,
          color: AppThemeDesign.defaulTheme.colorScheme.background
        ),
        obscuringCharacter: obscuringCharacter,
        decoration: InputDecoration(
          filled: true,
          hintText: hintText,
          fillColor: AppThemeDesign.defaulTheme.colorScheme.tertiary,
          hintStyle: AppStyleDesign.fontStyleInter(
            context: context,
            size: size.height * .017,
            fontWeight: FontWeight.w500,
            color: hintTextColor ?? AppThemeDesign.defaulTheme.colorScheme.onBackground
          ),
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
              width: 1.2,
              color: AppThemeDesign.defaulTheme.colorScheme.background.withOpacity(.18),
            )
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
              width: 1.2,
              color: AppThemeDesign.defaulTheme.colorScheme.background.withOpacity(.18),
            )
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
              width: 1.2,
              color: AppThemeDesign.defaulTheme.colorScheme.primary,
            )
          )
        ),
      ),
    );
  }
}
