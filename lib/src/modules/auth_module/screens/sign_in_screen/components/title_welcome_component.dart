import 'package:flutter/material.dart';

import '../../../../../core/presenter/common/design/app_style_design.dart';
import '../../../../../core/presenter/common/design/app_theme_design.dart';
import '../../../../../core/presenter/utils/constants/app_name_constant.dart';

class TitleWelcomeComponent extends StatelessWidget {
  const TitleWelcomeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: Text(
        AppNameConstant.titleSignInText,
        style: AppStyleDesign.fontStyleInter(
          context: context,
          size: size.height * .035,
          fontWeight: FontWeight.w600,
          color: AppThemeDesign.defaulTheme.colorScheme.background 
        ),
      ),
    );
  }
}
