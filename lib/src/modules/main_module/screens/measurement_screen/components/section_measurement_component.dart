import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/presenter/common/design/app_style_design.dart';
import '../../../../../core/presenter/common/design/app_theme_design.dart';
import '../../../../../core/presenter/providers/module_providers/measurement_providers.dart';

class SectionMeasurementComponent extends ConsumerWidget {
  const SectionMeasurementComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.sizeOf(context);
    ref.watch(isMeasuringStateProvider);
    return Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.only(top: size.height * .05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            LottieBuilder.asset("assets/lottie/gD9hYRSVsa.json"),
            Gap(size.height * .04),
            SizedBox(
              child: Text(
                "Faça a medição a ser registrada\nagora!",
                textAlign: TextAlign.center,
                style: AppStyleDesign.fontStyleInter(
                  context: context,
                  size: size.height * .02,
                  fontWeight: FontWeight.w500,
                  color: AppThemeDesign.defaulTheme.colorScheme.background 
                ),
              ),
            ),
            Gap(size.height * .03),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => showDialog(
                      context: context, 
                      barrierColor: AppThemeDesign.defaulTheme.colorScheme.background.withOpacity(.8),
                      builder: (context) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.height * .02),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Material(
                              elevation: 2,
                              animationDuration: const Duration(seconds: 1),
                              color: AppThemeDesign.defaulTheme.colorScheme.surface,
                              borderRadius: const BorderRadius.all(Radius.circular(8)),
                              shadowColor: AppThemeDesign.defaulTheme.colorScheme.background.withOpacity(.3),
                              child: SizedBox(
                                height: size.height * .2,
                                width: size.width,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: size.width * .04),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(top: size.height * .02),
                                        child: Text(
                                          "Habilitação do flash",
                                          style: AppStyleDesign.fontStyleInter(
                                            context: context,
                                            size: size.height * .02, 
                                            fontWeight: FontWeight.w600,
                                            color: AppThemeDesign.defaulTheme.colorScheme.background
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: size.height * .02),
                                      Text(
                                        "É importante que habilite o flash a partir do ícone localizado acima, para garantir a precisão da medição. Caso não, será prejudica se desligada.",
                                        textAlign: TextAlign.center,
                                        style: AppStyleDesign.fontStyleInter(
                                          context: context,
                                          size: size.height * .018, 
                                          fontWeight: FontWeight.w500,
                                          color: AppThemeDesign.defaulTheme.colorScheme.onBackground
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ).animate()
                          .moveX(
                          end: 0,
                          begin: -200,
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastEaseInToSlowEaseOut
                        ).then()
                      )
                    ),
                    child: Text(
                      "Recomedação de uso",
                      textAlign: TextAlign.center,
                      style: AppStyleDesign.fontStyleInter(
                        context: context,
                        size: size.height * .016,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        color: AppThemeDesign.defaulTheme.colorScheme.onBackground 
                      ),
                    ),
                  ),
                  Gap(size.width * .02),
                  Icon(
                    LucideIcons.info,
                    size: size.height * .02,
                  )
                ],
              ),
            ),
            Gap(size.height * .05),
            SizedBox(
              child: GestureDetector(
                onTap: () => ref.read(isMeasuringStateProvider.notifier).state = true,
                child: Text(
                  "Começar a medir",
                  textAlign: TextAlign.center,
                  style: AppStyleDesign.fontStyleInter(
                    context: context,
                    size: size.height * .016,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                    color: AppThemeDesign.defaulTheme.colorScheme.primary,
                    decorationColor: AppThemeDesign.defaulTheme.colorScheme.primary
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
