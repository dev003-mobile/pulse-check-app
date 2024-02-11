import 'package:flutter/material.dart';

import '../../../../../core/presenter/common/design/app_style_design.dart';
import '../../../../../core/presenter/common/design/app_theme_design.dart';
import '../../../../../core/presenter/utils/constants/app_name_constant.dart';

class TextForgotPasswordComponent extends StatelessWidget {
  const TextForgotPasswordComponent({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: InkWell(
        onTap: () { },
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        child: Padding(
          padding: EdgeInsets.all(size.height * .008),
          child: Text(
            AppNameConstant.forgotPasswordText,
            style: AppStyleDesign.fontStyleInter(
              context: context,
              size: size.height * .015,
              fontWeight: FontWeight.w500,
              color: AppThemeDesign.defaulTheme.colorScheme.onBackground 
            ),
          ),
        ),
      ),
    );
  }
}
