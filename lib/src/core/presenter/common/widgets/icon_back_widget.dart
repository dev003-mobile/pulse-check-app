import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../routes/app_name_route.dart';
import '../design/app_theme_design.dart';

class IconBackWidget extends StatelessWidget {
  const IconBackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Material(
      color: AppThemeDesign.defaulTheme.colorScheme.surface,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppThemeDesign.defaulTheme.colorScheme.background.withOpacity(.1)),
        borderRadius: const BorderRadius.all(Radius.circular(8))
      ),
      child: SizedBox(
        height: size.height * .045,
        width: size.width * .09,
        child: InkWell(
          onTap: () => Get.offNamed(AppNameRoute.signInScreen),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: Icon(
            Icons.arrow_back_ios,
            size: size.height * .015,
          ),
        ),
      ),
    );
  }
}