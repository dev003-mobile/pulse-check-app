import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../_stores/slide_store.dart';
import '../../../../../core/presenter/common/design/app_theme_design.dart';

class SmoothPageComponent extends ConsumerWidget {
  SmoothPageComponent({super.key});

  final SlideStore _store = GetIt.I.get<SlideStore>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.only(bottom: size.height * .22),
        child: SizedBox(
          child: SmoothPageIndicator(
            count: 3,
            controller: _store.pageController,
            effect: ExpandingDotsEffect(
              dotWidth: size.width * .024,
              dotHeight: size.height * .0105,
              dotColor: AppThemeDesign.defaulTheme.colorScheme.background.withOpacity(.08),
              activeDotColor: AppThemeDesign.defaulTheme.colorScheme.primary,
            ),
            onDotClicked: (page) => _store.pageController.animateToPage(
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
