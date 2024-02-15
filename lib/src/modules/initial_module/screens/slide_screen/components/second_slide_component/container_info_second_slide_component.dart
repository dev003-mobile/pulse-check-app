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

class ContainerInfoSecondSlideComponent extends StatelessWidget {
  ContainerInfoSecondSlideComponent({super.key});

  final SlideStore _store = GetIt.I.get<SlideStore>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Expanded(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          SizedBox(
            child: Image.asset(
              AppImageConstants.checkListImage
            ).animate()
             .shakeY(
              hz: 1,
              amount: 10,
              duration: const Duration(seconds: 2),
              curve: Curves.fastEaseInToSlowEaseOut
             )
          ),
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  child: DescriptionSlideWidget(
                    title: AppNameConstant.secondSlideTitleText,
                    description: AppNameConstant.secondSlideDescriptionText,
                  ),
                ),
                Gap(size.height * .13),
                SizedBox(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: size.height * .07),
                    child: ButtonOpacityWidget(
                      onTap: () => _store.pageController.animateToPage(
                        2, 
                        duration: const Duration(seconds: 1), 
                        curve: Curves.fastEaseInToSlowEaseOut
                      ),
                      provider: buttonSecondSlideStateProvider,
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