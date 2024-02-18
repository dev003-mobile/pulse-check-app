import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/presenter/common/design/app_style_design.dart';
import '../../../../../core/presenter/common/design/app_theme_design.dart';
import '../../../../../core/presenter/utils/constants/app_name_constant.dart';
import '../../../../../core/presenter/common/widgets/button_opacity_widget.dart';
import '../../../../../core/presenter/providers/module_providers/measurement_providers.dart';

class ShowModalResultComponent extends ConsumerWidget {
  const ShowModalResultComponent(this.value, {super.key});

  final int value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      color: AppThemeDesign.defaulTheme.colorScheme.surface,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * .3,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width * .04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * .02),
                child: Text(
                  "Resultado",
                  style: AppStyleDesign.fontStyleInter(
                    context: context,
                    size: MediaQuery.sizeOf(context).height * .04, 
                    fontWeight: FontWeight.w600,
                    color: AppThemeDesign.defaulTheme.colorScheme.background
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * .02),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      value.toString(),
                      textAlign: TextAlign.center,
                      style: AppStyleDesign.fontStyleInter(
                        context: context,
                        fontWeight: FontWeight.w500,
                        size: MediaQuery.sizeOf(context).height * .05, 
                        color: AppThemeDesign.defaulTheme.colorScheme.background
                      ),
                    ),
                    Gap(MediaQuery.sizeOf(context).width * .03),
                    Icon(
                      LucideIcons.heartPulse,
                      size: MediaQuery.sizeOf(context).height * .05,
                      color: AppThemeDesign.defaulTheme.colorScheme.primary,
                    )
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * .02),
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height * .02),
                  child: ButtonOpacityWidget(
                    onTap: () => Get.back(),
                    provider: buttonCloseModalStateProvider,
                    textButton: AppNameConstant.closeText,
                    backgroundColor: AppThemeDesign.defaulTheme.colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
