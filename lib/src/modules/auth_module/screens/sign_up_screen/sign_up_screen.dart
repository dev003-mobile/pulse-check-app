import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../../../core/presenter/common/design/app_style_design.dart';
import '../../../../core/presenter/common/design/app_theme_design.dart';
import '../../../../core/presenter/common/widgets/button_opacity_widget.dart';
import '../../../../core/presenter/common/widgets/button_with_google_widget.dart';
import '../../../../core/presenter/common/widgets/icon_back_widget.dart';
import '../../../../core/presenter/common/widgets/row_question_auth_widget.dart';
import '../../../../core/presenter/common/widgets/sign_in_another_account_widget.dart';
import '../../../../core/presenter/utils/constants/app_name_constant.dart';
import '../../../../core/presenter/common/widgets/textfield_default_widget.dart';
import '../../../../core/presenter/providers/module_providers/sign_up_providers.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    ref.watch(visiblePasswordStateProvider);
    ref.watch(visibleConfirmPasswordStateProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: size.height * .03,
            horizontal: size.width * .06
          ),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.only(bottom: size.height * .02),
            child: Column(
              children: <Widget>[
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const IconBackWidget(),
                      Gap(size.height * .03),
                      SizedBox(
                        child: Text(
                          AppNameConstant.titleSignUpText,
                          style: AppStyleDesign.fontStyleInter(
                            context: context,
                            size: size.height * .035,
                            fontWeight: FontWeight.w600,
                            color: AppThemeDesign.defaulTheme.colorScheme.background 
                          ),
                        ),
                      ),
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
                      Gap(size.height * .02),
                      TextFieldDefaultWidget(
                        obscureText: ref.read(visibleConfirmPasswordStateProvider.notifier).state,
                        hintText: AppNameConstant.confirmPasswordText,
                        suffixIcon: GestureDetector(
                          onTap: () => ref.read(visibleConfirmPasswordStateProvider.notifier).state = 
                            !(ref.read(visibleConfirmPasswordStateProvider.notifier).state),
                          child: ref.read(visibleConfirmPasswordStateProvider.notifier).state ? Icon(
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
                      Gap(size.height * .05),
                      SizedBox(
                        child: ButtonOpacityWidget(
                          onTap: () { },
                          provider: buttonSignUpStateProvider,
                          textButton: AppNameConstant.createAccountText,
                          backgroundColor: AppThemeDesign.defaulTheme.colorScheme.primary,
                        ),
                      ),
                      Gap(size.height * .035),
                      SignInAnotherAccountWidget(
                        text: AppNameConstant.signUpAnotherAccountText,
                      ),
                      Gap(size.height * .035),
                      const ButtonWithGoogleWidget()
                    ],
                  ),
                ),
                Gap(size.height * .1),
                RowQuestionAuthWidget(
                  onTap: () => Get.back(),
                  actionText: AppNameConstant.logInText,
                  question: AppNameConstant.haveAnAccountText,
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}