import 'package:gap/gap.dart';
import 'package:flutter/material.dart';

import '../../../../../core/presenter/common/design/app_style_design.dart';
import '../../../../../core/presenter/common/design/app_theme_design.dart';
import '../../../../../core/presenter/utils/constants/app_name_constant.dart';
import '../../../../../core/presenter/utils/constants/app_image_constants.dart';
import '../../../../../core/presenter/common/widgets/button_opacity_widget.dart';
import '../../../../../core/presenter/providers/module_providers/sign_in_providers.dart';

class ButtonSignInGoogleComponent extends StatelessWidget {
  const ButtonSignInGoogleComponent({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: ButtonOpacityWidget(
        onTap: () { },
        provider: buttonSignInGoogleSlideStateProvider,
        backgroundColor: AppThemeDesign.defaulTheme.colorScheme.background,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              child: Image.asset(
                scale: 1.4,
                AppImageConstants.googleImage
              ),
            ),
            Gap(size.width * .04),
            SizedBox(
              child: Text(
                AppNameConstant.logInGoogleText,
                style: AppStyleDesign.fontStyleInter(
                  context: context,
                  letterSpacing: size.width * .0016,
                  size: size.height * .0165, 
                  fontWeight: FontWeight.w500,
                  color: AppThemeDesign.defaulTheme.colorScheme.surface
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
