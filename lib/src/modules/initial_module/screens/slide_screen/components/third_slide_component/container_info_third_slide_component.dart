import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../../core/presenter/common/routes/app_name_route.dart';
import '../../../../../../core/presenter/common/design/app_theme_design.dart';
import '../../../../../../core/presenter/providers/module_providers/slide_providers.dart';
import '../../../../../../core/presenter/utils/constants/app_name_constant.dart';
import '../../../../../../core/presenter/utils/constants/app_image_constants.dart';
import '../../../../../../core/presenter/common/widgets/button_opacity_widget.dart';
import '../../../../../../core/presenter/common/widgets/description_slide_widget.dart';

class ContainerInfoThirdSlideComponent extends StatelessWidget {
  const ContainerInfoThirdSlideComponent({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        SizedBox( 
          child: Padding(
            padding: EdgeInsets.only(bottom: size.height * .4),
            child: Image.asset(
              scale: 1.5,
              AppImageConstants.graphImage
            ).animate()
             .flipH(
              perspective: -6,
              duration: const Duration(seconds: 1),
              curve: Curves.fastEaseInToSlowEaseOut,
              delay: const Duration(milliseconds: 100),
            ),
          )
        ),
        SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                child: DescriptionSlideWidget(
                  title: AppNameConstant.thirdSlideTitleText,
                  description: AppNameConstant.thirdSlideDescriptionText,
                ),
              ),
              Gap(size.height * .13),
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.only(bottom: size.height * .07),
                  child: ButtonOpacityWidget(
                    onTap: () => Get.offNamed(AppNameRoute.signInScreen),
                    textButton: AppNameConstant.startText,
                    provider: buttonThirdSlideStateProvider,
                    backgroundColor: AppThemeDesign.defaulTheme.colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}