import 'package:gap/gap.dart';
import 'package:flutter/material.dart';

import 'button_opacity_widget.dart';
import '../design/app_style_design.dart';
import '../design/app_theme_design.dart';
import '../../utils/constants/app_name_constant.dart';
import '../../utils/constants/app_image_constants.dart';
import '../../providers/module_providers/sign_in_providers.dart';

class ButtonWithGoogleWidget extends StatelessWidget {
  const ButtonWithGoogleWidget({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: ButtonOpacityWidget(
        onTap: onTap,
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
