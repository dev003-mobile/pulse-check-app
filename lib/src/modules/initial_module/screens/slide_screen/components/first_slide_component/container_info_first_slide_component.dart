import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../_stores/slide_store.dart';
import '../../../../../../core/presenter/common/design/app_theme_design.dart';
import '../../../../../../core/presenter/utils/constants/app_name_constant.dart';
import '../../../../../../core/presenter/utils/constants/app_image_constants.dart';
import '../../../../../../core/presenter/common/widgets/button_opacity_widget.dart';
import '../../../../../../core/presenter/common/widgets/description_slide_widget.dart';
import '../../../../../../core/presenter/providers/module_providers/slide_providers.dart';

class ContainerInfoFirstSlideComponent extends StatelessWidget {
  ContainerInfoFirstSlideComponent({super.key});

  final SlideStore _store = GetIt.I.get<SlideStore>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Expanded(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          SizedBox(
            child: Padding(
              padding: EdgeInsets.only(top: size.height * .03),
              child: Image.asset(
                scale: 1.5,
                AppImageConstants.hearthImage
              ).animate()
               .moveX(
                begin: -300,
                duration: const Duration(seconds: 1),
                curve: Curves.fastEaseInToSlowEaseOut
              ).then(),
            )
          ),
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  child: DescriptionSlideWidget(
                    title: AppNameConstant.firstSlideTitleText,
                    description: AppNameConstant.firstSlideDescriptionText,
                  ),
                ),
                Gap(size.height * .13),
                SizedBox(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: size.height * .07),
                    child: ButtonOpacityWidget(
                      onTap: () => _store.pageController.animateToPage(
                        1, 
                        duration: const Duration(seconds: 1), 
                        curve: Curves.fastEaseInToSlowEaseOut
                      ),
                      provider: buttonFirstSlideStateProvider,
                      textButton: AppNameConstant.continueText,
                      backgroundColor: AppThemeDesign.defaulTheme.colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}