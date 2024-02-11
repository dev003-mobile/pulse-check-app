import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/presenter/common/design/app_theme_design.dart';

class SmoothPageComponent extends ConsumerWidget {
  const SmoothPageComponent(this._pageController, {super.key});

  final PageController _pageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.only(bottom: size.height * .22),
        child: SizedBox(
          child: SmoothPageIndicator(
            count: 3,
            controller: _pageController,
            effect: ExpandingDotsEffect(
              dotWidth: size.width * .024,
              dotHeight: size.height * .0105,
              dotColor: AppThemeDesign.defaulTheme.colorScheme.background.withOpacity(.08),
              activeDotColor: AppThemeDesign.defaulTheme.colorScheme.primary,
            ),
            onDotClicked: (page) => _pageController.animateToPage(
              page,
              duration: const Duration(seconds: 1),
              curve: Curves.fastEaseInToSlowEaseOut,
            ),
          ),
        ),
      ),
    );
  }
}
