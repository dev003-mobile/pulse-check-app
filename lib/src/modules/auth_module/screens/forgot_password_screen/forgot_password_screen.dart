import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../_stores/forgot_password_store.dart';
import '../../../../core/presenter/common/design/app_style_design.dart';
import '../../../../core/presenter/common/design/app_theme_design.dart';
import '../../../../core/presenter/common/widgets/icon_back_widget.dart';
import '../../../../core/presenter/utils/constants/app_name_constant.dart';
import '../../../../core/presenter/common/widgets/button_opacity_widget.dart';
import '../../../../core/presenter/common/widgets/textfield_default_widget.dart';
import '../../../../core/presenter/common/widgets/render_message_info_widget.dart';
import '../../../../core/presenter/providers/module_providers/forgot_password_providers.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  ForgotPasswordScreen({super.key});

  final ForgotPasswordStore _store = GetIt.I.get<ForgotPasswordStore>();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  @override
  void initState() {
    super.initState();
    widget._store.emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    ref.watch(buttonForgotPasswordIsLoadingStateProvider);
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
                  controller: widget._store.emailController,
                ),
              ),
              Gap(size.height * .02),
              SizedBox(
                child: ButtonOpacityWidget(
                  onTap: () async { 
                    if (widget._store.fieldsIsEmpty()) {
                      return RenderMessageInfo.render(
                        context: context, 
                        size: size.height * .016, 
                        message: AppNameConstant.fillInTheField
                      );
                    } else if (!widget._store.isEmailValid()) {
                      return RenderMessageInfo.render(
                        context: context, 
                        size: size.height * .016, 
                        message: AppNameConstant.enterEmailValid
                      );
                    } else {
                      ref.read(buttonForgotPasswordIsLoadingStateProvider.notifier).state = true;
                      await widget._store.forgotPassword(widget._store.emailController.text).then((_) {
                        Get.back();
                        return RenderMessageInfo.render(
                          context: context, 
                          size: size.height * .016, 
                          message: AppNameConstant.checkYourMailBox,
                          color: AppThemeDesign.defaulTheme.colorScheme.primary
                        );
                      });
                      ref.read(buttonForgotPasswordIsLoadingStateProvider.notifier).state = false;
                    }
                  },
                  textButton: AppNameConstant.recoverText,
                  provider: buttonForgotPasswordStateProvider,
                  backgroundColor: AppThemeDesign.defaulTheme.colorScheme.background,
                  isLoading: ref.read(buttonForgotPasswordIsLoadingStateProvider.notifier).state,
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}