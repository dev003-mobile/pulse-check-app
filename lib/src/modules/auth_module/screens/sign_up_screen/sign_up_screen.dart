import 'package:blood_pressure_measurement/src/core/presenter/common/routes/app_name_route.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../_stores/sign_up_store.dart';
import '../../../../core/domain/entities/user_entity.dart';
import '../../../../core/presenter/common/design/app_style_design.dart';
import '../../../../core/presenter/common/design/app_theme_design.dart';
import '../../../../core/presenter/common/widgets/icon_back_widget.dart';
import '../../../../core/presenter/utils/constants/app_name_constant.dart';
import '../../../../core/presenter/common/widgets/button_opacity_widget.dart';
import '../../../../core/presenter/common/widgets/textfield_default_widget.dart';
import '../../../../core/presenter/common/widgets/row_question_auth_widget.dart';
import '../../../../core/presenter/common/widgets/render_message_info_widget.dart';
import '../../../../core/presenter/providers/module_providers/sign_up_providers.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  SignUpScreen({super.key});

  final SignUpStore _store = GetIt.I.get<SignUpStore>();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  @override
  void initState() {
    super.initState();
    widget._store.emailController = TextEditingController();
    widget._store.yourNameController = TextEditingController();
    widget._store.passwordController = TextEditingController();
    widget._store.confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    widget._store.emailController.dispose();
    widget._store.yourNameController.dispose();
    widget._store.passwordController.dispose();
    widget._store.confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    ref.watch(visiblePasswordStateProvider);
    ref.watch(buttonSignUpIsLoadingStateProvider);
    ref.watch(visibleConfirmPasswordStateProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * .06),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.only(
              top: size.height * .03,
              bottom: size.height * .02
            ),
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
                        hintText: AppNameConstant.yourNameText,
                        controller: widget._store.yourNameController,
                      ),
                      Gap(size.height * .02),
                      TextFieldDefaultWidget(
                        hintText: AppNameConstant.emailText,
                        controller: widget._store.emailController,
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
                      Gap(size.height * .02),
                      TextFieldDefaultWidget(
                        controller: widget._store.confirmPasswordController,
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
                          onTap: () async {
                            if (widget._store.fieldsIsEmpty()) {
                              return RenderMessageInfo.render(
                                context: context, 
                                size: size.height * .016, 
                                message: AppNameConstant.fillInTheFields
                              );
                            } else if (!widget._store.isEqualsPasswords()) {
                              return RenderMessageInfo.render(
                                context: context, 
                                size: size.height * .016, 
                                message: AppNameConstant.combinePasswords
                              );
                            } else if (!widget._store.isEmailValid()) {
                              return RenderMessageInfo.render(
                                context: context, 
                                size: size.height * .016, 
                                message: AppNameConstant.enterEmailValid
                              );
                            } else {
                              FocusScope.of(context).unfocus();
                              ref.read(buttonSignUpIsLoadingStateProvider.notifier).state = true;
                              final user = UserEntity(
                                email: widget._store.emailController.text,
                                name: widget._store.yourNameController.text,
                                password: widget._store.passwordController.text
                              );
                              await widget._store.signUp(user).then((result) {
                                result.fold(
                                  (error) => RenderMessageInfo.render(
                                    context: context, 
                                    size: size.height * .016, 
                                    message: error.toString(),
                                  ), 
                                  (success) {
                                    Get.back();
                                    return RenderMessageInfo.render(
                                      context: context, 
                                      size: size.height * .016, 
                                      message: AppNameConstant.createdAccount,
                                      color: AppThemeDesign.defaulTheme.colorScheme.primary
                                    );
                                  }
                                );
                              });
                              ref.read(buttonSignUpIsLoadingStateProvider.notifier).state = false;
                            }
                           },
                          provider: buttonSignUpStateProvider,
                          textButton: AppNameConstant.createAccountText,
                          backgroundColor: AppThemeDesign.defaulTheme.colorScheme.primary,
                          isLoading: ref.read(buttonSignUpIsLoadingStateProvider.notifier).state,
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(size.height * .1),
                RowQuestionAuthWidget(
                  actionText: AppNameConstant.logInText,
                  question: AppNameConstant.haveAnAccountText,
                  onTap: () => Get.offNamed(AppNameRoute.signInScreen),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}