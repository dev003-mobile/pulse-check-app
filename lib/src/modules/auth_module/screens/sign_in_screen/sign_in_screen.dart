import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../_stores/sign_in_store.dart';
import 'components/title_welcome_component.dart';
import 'components/text_forgot_password_component.dart';
import '../../../../core/domain/entities/sign_in_entity.dart';
import '../../../../core/presenter/common/routes/app_name_route.dart';
import '../../../../core/presenter/common/design/app_theme_design.dart';
import '../../../../core/presenter/utils/constants/app_name_constant.dart';
import '../../../../core/presenter/common/widgets/button_opacity_widget.dart';
import '../../../../core/presenter/common/widgets/row_question_auth_widget.dart';
import '../../../../core/presenter/common/widgets/textfield_default_widget.dart';
import '../../../../core/presenter/common/widgets/button_with_google_widget.dart';
import '../../../../core/presenter/common/widgets/render_message_info_widget.dart';
import '../../../../core/presenter/providers/module_providers/sign_in_providers.dart';
import '../../../../core/presenter/common/widgets/sign_in_another_account_widget.dart';

class SignInScreen extends ConsumerStatefulWidget {
  SignInScreen({super.key});

  final SignInStore _store = GetIt.I.get<SignInStore>();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  @override
  void initState() {
    super.initState();
    widget._store.emailController = TextEditingController();
    widget._store.passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    widget._store.emailController.dispose();
    widget._store.passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    ref.watch(visiblePasswordStateProvider);
    ref.watch(buttonSignInIsLoadingStateProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * .06),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.only(
              top: size.height * .06,
              bottom: size.height * .02
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      const TitleWelcomeComponent(),
                      Gap(size.height * .06),
                      TextFieldDefaultWidget(
                        controller: widget._store.emailController,
                        hintText: AppNameConstant.emailText,
                      ),
                      Gap(size.height * .02),
                      TextFieldDefaultWidget(
                        controller: widget._store.passwordController,
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
                          textButton: AppNameConstant.logInText,
                          provider: buttonSignInStateProvider,
                          onTap: () async {
                            if (widget._store.fieldsIsEmpty()) {
                              return RenderMessageInfo.render(
                                context: context, 
                                size: size.height * .016, 
                                message: AppNameConstant.fillInTheFields
                              );
                            } else {
                              ref.read(buttonSignInIsLoadingStateProvider.notifier).state = true;
                              final SignInEntity data = SignInEntity(
                                email: widget._store.emailController.text,
                                password: widget._store.passwordController.text
                              );
                              await widget._store.signIn(data).then((result) {
                                result.fold(
                                  (error) => RenderMessageInfo.render(
                                    context: context, 
                                    size: size.height * .016, 
                                    message: error.toString()
                                  ), 
                                  (success) => Get.offNamed(AppNameRoute.mainScreen)
                                );
                              });
                              ref.read(buttonSignInIsLoadingStateProvider.notifier).state = false;
                            }
                          },
                          backgroundColor: AppThemeDesign.defaulTheme.colorScheme.primary,
                          isLoading: ref.read(buttonSignInIsLoadingStateProvider.notifier).state,
                        ),
                      ),
                      Gap(size.height * .035),
                      const SignInAnotherAccountWidget(),
                      Gap(size.height * .035),
                      ButtonWithGoogleWidget(
                        onTap: () async => await widget._store.signInWithGoogle().then((result) {
                          result.fold(
                            (error) => RenderMessageInfo.render(
                              context: context, 
                              size: size.height * .016, 
                              message: error.toString()
                            ), 
                            (success) => Get.offNamed(AppNameRoute.mainScreen)
                          );
                        }),
                      )
                    ],
                  ),
                ),
                Gap(size.height * .16),
                RowQuestionAuthWidget(
                  actionText: AppNameConstant.createText,
                  question: AppNameConstant.dontHaveAnAccountText,
                  onTap: () => Get.toNamed(AppNameRoute.signUpScreen),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}