import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/presenter/common/design/app_style_design.dart';
import '../../../../../core/presenter/common/design/app_theme_design.dart';
import '../../../../../core/presenter/utils/constants/app_image_constants.dart';

class CardDateComponent extends StatelessWidget {
  const CardDateComponent({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: Material(
        elevation: 5,
        color: AppThemeDesign.defaulTheme.colorScheme.primary,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: SizedBox(
          width: size.width,
          height: size.height * .13,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .06),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        child: Text(
                          "FEB",
                          style: AppStyleDesign.fontStyleInter(
                            context: context,
                            size: size.height * .03,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                      Gap(size.height * .005),
                      SizedBox(
                        child: Text(
                          "Fevereiro, 12 de 2024",
                          style: AppStyleDesign.fontStyleInter(
                            context: context,
                            size: size.height * .014,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  )
                ),
                SizedBox(
                  child: Image.asset(
                    AppImageConstants.formImage,
                    color: AppThemeDesign.defaulTheme.colorScheme.surface,
                  ),
                ),
                SizedBox(
                  child: Icon(
                    size: size.height * .05,
                    LucideIcons.calendarDays,
                    color: AppThemeDesign.defaulTheme.colorScheme.surface,
                  ),
                )
              ],
            ),
          ),
        ),
      ).animate()
        .moveX(
        begin: 200,
        duration: const Duration(seconds: 1),
        curve: Curves.fastEaseInToSlowEaseOut
      )
    );
  }
}
