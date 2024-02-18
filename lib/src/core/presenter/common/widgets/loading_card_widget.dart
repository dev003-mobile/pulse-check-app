import 'package:flutter/material.dart';

import '../design/app_theme_design.dart';

class LoadingCardWidget extends StatelessWidget {
  const LoadingCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: size.width * .42,
      height: size.height * .1,
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 0.8,
          color: AppThemeDesign.defaulTheme.colorScheme.primary,
        ),
      ),
    );
  }
}
