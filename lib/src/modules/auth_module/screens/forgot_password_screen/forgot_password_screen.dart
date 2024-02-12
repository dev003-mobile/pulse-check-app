import 'package:gap/gap.dart';
import 'package:flutter/material.dart';

import '../../../../core/presenter/common/design/app_style_design.dart';
import '../../../../core/presenter/common/design/app_theme_design.dart';
import '../../../../core/presenter/common/widgets/icon_back_widget.dart';
import '../../../../core/presenter/utils/constants/app_name_constant.dart';
import '../../../../core/presenter/common/widgets/button_opacity_widget.dart';
import '../../../../core/presenter/common/widgets/textfield_default_widget.dart';
import '../../../../core/presenter/providers/module_providers/forgot_password_providers.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: size.height * .06,
            horizontal: size.width * .06
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const IconBackWidget(),
              Gap(size.height * .03),
              SizedBox(
                child: Text(
                  AppNameConstant.titleForgotPasswordText,
                  style: AppStyleDesign.fontStyleInter(
                    context: context,
                    size: size.height * .035,
                    fontWeight: FontWeight.w600,
                    color: AppThemeDesign.defaulTheme.colorScheme.background 
                  ),
                ),
              ),
              Gap(size.height * .01),
              SizedBox(
                child: Text(
                  AppNameConstant.descriptionForgotPasswordText,
                  style: AppStyleDesign.fontStyleInter(
                    context: context,
                    size: size.height * .016,
                    fontWeight: FontWeight.w600,
                    color: AppThemeDesign.defaulTheme.colorScheme.onBackground 
                  ),
                ),
              ),
              Gap(size.height * .05),
              SizedBox(
                child: TextFieldDefaultWidget(
                  hintText: AppNameConstant.emailText,
                ),
              ),
              Gap(size.height * .02),
              SizedBox(
                child: ButtonOpacityWidget(
                  onTap: () { },
                  textButton: AppNameConstant.recoverText,
                  provider: buttonForgotPasswordStateProvider,
                  backgroundColor: AppThemeDesign.defaulTheme.colorScheme.background,
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}