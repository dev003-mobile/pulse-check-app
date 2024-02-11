import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/title_welcome_component.dart';
import 'components/text_forgot_password_component.dart';
import 'components/button_sign_in_google_component.dart';
import 'components/sign_in_another_account_component.dart';
import '../../../../core/presenter/common/design/app_theme_design.dart';
import '../../../../core/presenter/utils/constants/app_name_constant.dart';
import '../../../../core/presenter/common/widgets/button_opacity_widget.dart';
import '../../../../core/presenter/common/widgets/row_question_auth_widget.dart';
import '../../../../core/presenter/common/widgets/textfield_default_widget.dart';
import '../../../../core/presenter/providers/module_providers/sign_in_providers.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    ref.watch(visiblePasswordStateProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: size.height * .06,
            horizontal: size.width * .06
          ),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.only(bottom: size.height * .02),
            child: Column(
              children: <Widget>[
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      const TitleWelcomeComponent(),
                      Gap(size.height * .06),
                      TextFieldDefaultWidget(
                        hintText: AppNameConstant.emailText,
                      ),
                      Gap(size.height * .02),
                      TextFieldDefaultWidget(
                        obscureText: ref.read(visiblePasswordStateProvider.notifier).state,
                        hintText: AppNameConstant.passwordText,
                        suffixIcon: GestureDetector(
                          onTap: () => ref.read(visiblePasswordStateProvider.notifier).state = 
                            !(ref.read(visiblePasswordStateProvider.notifier).state),
                          child: ref.read(visiblePasswordStateProvider.notifier).state ? Icon(
                            Icons.visibility,
                            size: size.height * .025,
                            color: AppThemeDesign.defaulTheme.colorScheme.onBackground,
                          ) : Icon(
                            Icons.visibility_off,
                            size: size.height * .025,
                            color: AppThemeDesign.defaulTheme.colorScheme.onBackground,
                          ),
                        ),
                      ),
                      Gap(size.height * .01),
                      const TextForgotPasswordComponent(),
                      Gap(size.height * .05),
                      SizedBox(
                        child: ButtonOpacityWidget(
                          onTap: () { },
                          textButton: AppNameConstant.logInText,
                          provider: buttonSignInSlideStateProvider,
                          backgroundColor: AppThemeDesign.defaulTheme.colorScheme.primary,
                        ),
                      ),
                      Gap(size.height * .035),
                      const SignInAnotherAccountComponent(),
                      Gap(size.height * .035),
                      const ButtonSignInGoogleComponent()
                    ],
                  ),
                ),
                Gap(size.height * .16),
                RowQuestionAuthWidget(
                  onTap: () { },
                  actionText: AppNameConstant.createText,
                  question: AppNameConstant.dontHaveAnAccountText,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}