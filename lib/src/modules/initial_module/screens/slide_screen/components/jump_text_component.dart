import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/presenter/common/routes/app_name_route.dart';
import '../../../../../core/presenter/common/design/app_style_design.dart';
import '../../../../../core/presenter/common/design/app_theme_design.dart';
import '../../../../../core/presenter/utils/constants/app_name_constant.dart';

class JumpTextComponent extends ConsumerWidget {
  const JumpTextComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.sizeOf(context);
    return Expanded(
      flex: 0,
      child: Padding(
        padding: EdgeInsets.only(top: size.height * .02),
        child: TextButton(
          onPressed: () => Get.offNamed(AppNameRoute.signInScreen),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))
            ))
          ), 
          child: Text(
            AppNameConstant.jumpText,
            style: AppStyleDesign.fontStyleInter(
              context: context,
              size: size.height * .016, 
              fontWeight: FontWeight.w500,
              color: AppThemeDesign.defaulTheme.colorScheme.background
            ),
          )
        ),
      )
    );
  }
}