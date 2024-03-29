import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../_stores/main_store.dart';
import '../../../../core/presenter/providers/global_providers.dart';
import '../../../../core/presenter/common/design/app_theme_design.dart';
import '../../../../core/presenter/common/widgets/bottom_item_widget.dart';
import '../../../../core/presenter/utils/constants/app_name_constant.dart';

class BottomNavigationComponent extends ConsumerWidget {
  BottomNavigationComponent({super.key});

  final MainStore _store = GetIt.I.get<MainStore>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.sizeOf(context);
    ref.watch(isRollingProvider);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(bottom: size.height * .04),
        child: Visibility(
          visible: ref.read(isRollingProvider.notifier).state,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .1),
            child: Material(
              color: AppThemeDesign.defaulTheme.colorScheme.primary,
              borderRadius: const BorderRadius.all(Radius.circular(45)),
              child: SizedBox(
                width: size.width,
                height: size.height * .08,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * .02),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: BoottomItemWidget(
                          title: AppNameConstant.measurementsText,
                          selected: ref.read(currentIndexProvider.notifier).state == 0,
                          onTap: () {
                            ref.read(currentIndexProvider.notifier).state = 0;
                            _store.pageController.animateToPage(
                              ref.read(currentIndexProvider.notifier).state, 
                              duration: const Duration(seconds: 1), 
                              curve: Curves.fastEaseInToSlowEaseOut
                            );
                          },
                          icon: LucideIcons.list,
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: SizedBox(
                          height: size.height * .06,
                          width: size.width * .135,
                          child: FloatingActionButton(
                            onPressed: () {
                              ref.read(currentIndexProvider.notifier).state = 1;
                              _store.pageController.animateToPage (
                                ref.read(currentIndexProvider.notifier).state, 
                                duration: const Duration(seconds: 1), 
                                curve: Curves.fastEaseInToSlowEaseOut
                              );
                            },
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(45))
                            ),
                            backgroundColor: AppThemeDesign.defaulTheme.colorScheme.surface,
                            child: Center(
                              child: Icon(
                                LucideIcons.heartPulse,
                                color: AppThemeDesign.defaulTheme.colorScheme.primary,
                              ),
                            ),
                          ).animate()
                           .moveY(
                            end: 0,
                            begin: 200,
                            curve: Curves.fastEaseInToSlowEaseOut,
                            duration: const Duration(milliseconds: 800)
                          )
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: BoottomItemWidget(
                          title: AppNameConstant.profileText,
                          selected: ref.read(currentIndexProvider.notifier).state == 2,
                          onTap: () {
                            ref.read(currentIndexProvider.notifier).state = 2;
                            _store.pageController.animateToPage(
                              ref.read(currentIndexProvider.notifier).state, 
                              duration: const Duration(seconds: 1), 
                              curve: Curves.fastEaseInToSlowEaseOut
                            );
                          },
                          icon: LucideIcons.user2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ).animate()
              .moveY(
              end: 0,
              begin: 100,
              curve: Curves.fastEaseInToSlowEaseOut,
              duration: const Duration(milliseconds: 700)
            ),
          ),
        ),
      ),
    );
  }
}