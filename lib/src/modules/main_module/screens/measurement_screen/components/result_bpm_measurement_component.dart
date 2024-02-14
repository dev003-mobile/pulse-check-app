import 'dart:async';

import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:heart_bpm/heart_bpm.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../../../../../core/presenter/common/design/app_style_design.dart';
import '../../../../../core/presenter/common/design/app_theme_design.dart';
import '../../../../../core/presenter/common/widgets/button_opacity_widget.dart';
import '../../../../../core/presenter/providers/global_providers.dart';
import '../../../../../core/presenter/providers/module_providers/measurement_providers.dart';
import '../../../../../core/presenter/utils/constants/app_name_constant.dart';

class ResultBPMMeasurementComponent extends ConsumerStatefulWidget {
  const ResultBPMMeasurementComponent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ResultBPMMeasurementComponentState();
}

class _ResultBPMMeasurementComponentState extends ConsumerState<ResultBPMMeasurementComponent> {
  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() {
      Future.delayed(const Duration(seconds: 20), () {
        ref.read(isMeasuringStateProvider.notifier).state = false;
        if (mounted) {
          return showModalBottomSheet(
            context: context, 
            isDismissible: false,
            builder: (_) => Material(
              color: AppThemeDesign.defaulTheme.colorScheme.surface,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * .3,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width * .04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * .02),
                        child: Text(
                          "Resultado",
                          style: AppStyleDesign.fontStyleInter(
                            context: context,
                            size: MediaQuery.sizeOf(context).height * .04, 
                            fontWeight: FontWeight.w600,
                            color: AppThemeDesign.defaulTheme.colorScheme.background
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.sizeOf(context).height * .02),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              ref.read(bpmHearthBPMStateProvider.notifier).state.toString(),
                              textAlign: TextAlign.center,
                              style: AppStyleDesign.fontStyleInter(
                                context: context,
                                fontWeight: FontWeight.w500,
                                size: MediaQuery.sizeOf(context).height * .05, 
                                color: AppThemeDesign.defaulTheme.colorScheme.background
                              ),
                            ),
                            Gap(MediaQuery.sizeOf(context).width * .03),
                            Icon(
                              LucideIcons.heartPulse,
                              size: MediaQuery.sizeOf(context).height * .05,
                              color: AppThemeDesign.defaulTheme.colorScheme.primary,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.sizeOf(context).height * .02),
                      SizedBox(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height * .02),
                          child: ButtonOpacityWidget(
                            onTap: () => Get.back(),
                            provider: buttonCloseModalStateProvider,
                            textButton: AppNameConstant.closeText,
                            backgroundColor: AppThemeDesign.defaulTheme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          );
        }
        ref.read(bpmHearthBPMStateProvider.notifier).state = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    ref.watch(currentIndexProvider);
    ref.watch(isMeasuringStateProvider);
    ref.watch(bpmHearthBPMStateProvider);
    ref.watch(dataHearthBPMStateProvider);
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.only(top: size.height * .03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(
              flex: 0,
              child: SizedBox(
                child: GestureDetector(
                  onTap: () {
                    ref.read(bpmHearthBPMStateProvider.notifier).state = 0;
                    ref.read(isMeasuringStateProvider.notifier).state = false;
                  },
                  child: const Icon(
                    LucideIcons.x,
                  ),
                ),
              ),
            ),
            Gap(size.height * .02),
            Center(
              child: HeartBPMDialog(
                context: context,
                borderRadius: 45,
                showTextValues: true,
                cameraWidgetWidth: size.width * .11,
                cameraWidgetHeight: size.height * .05,
                sampleDelay: 1000 ~/ 7,
                onRawData: (value) {
                  if (ref.read(dataHearthBPMStateProvider.notifier).state.length >= 100) ref.read(dataHearthBPMStateProvider.notifier).state.removeAt(0);
                  ref.read(dataHearthBPMStateProvider.notifier).state.add(value);
                },
                onBPM: (value) => ref.read(bpmHearthBPMStateProvider.notifier).state = value,
              ),
            ).animate()
              .moveY(
              begin: -300,
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastEaseInToSlowEaseOut
              ),
            Gap(size.height * .02),
            Expanded(
              flex: 1,
              child: SizedBox(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      child: Text(
                        ref.read(bpmHearthBPMStateProvider.notifier).state > 0 ? 
                        "Medindo..."  : "Nenhum dedo foi detectado",
                        style: AppStyleDesign.fontStyleInter(
                          context: context,
                          size: size.height * .018,
                          fontWeight: FontWeight.w500,
                          color: AppThemeDesign.defaulTheme.colorScheme.background 
                        ),
                      ),
                    ),
                    Gap(size.height * .01),
                    SizedBox(
                      height: size.height * .03,
                      child: Center(
                        child: AnimatedTextKit(
                          animatedTexts: <AnimatedText>[
                            FadeAnimatedText(
                              "Pressione o seu dedo na câmera",
                              textStyle: AppStyleDesign.fontStyleInter(
                                context: context,
                                size: size.height * .018,
                                fontWeight: FontWeight.w500,
                                color: AppThemeDesign.defaulTheme.colorScheme.onBackground 
                              ),
                            ),
                          ],
                          repeatForever: true,
                          isRepeatingAnimation: true,
                          displayFullTextOnTap: true,
                          pause: const Duration(milliseconds: 700),
                        )
                      ),
                    ),
                    Gap(size.height * .04),
                    SizedBox(
                      child: Padding(
                        padding: EdgeInsets.only(top: size.height * .1),
                        child: AvatarGlow(
                          animate: true,
                          glowShape: BoxShape.circle,
                          curve: Curves.fastEaseInToSlowEaseOut,
                          glowColor: AppThemeDesign.defaulTheme.colorScheme.primary,
                          child: Container(
                            height: size.height * .14,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppThemeDesign.defaulTheme.colorScheme.primary
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    child: Text(
                                      ref.read(bpmHearthBPMStateProvider.notifier).state.toString(),
                                      style: AppStyleDesign.fontStyleInter(
                                        context: context,
                                        size: size.height * .05,
                                        fontWeight: FontWeight.w800,
                                        color: AppThemeDesign.defaulTheme.colorScheme.surface 
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    child: Text(
                                      "BPM",
                                      style: AppStyleDesign.fontStyleInter(
                                        context: context,
                                        size: size.height * .01,
                                        fontWeight: FontWeight.w800,
                                        color: AppThemeDesign.defaulTheme.colorScheme.surface 
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ),
                      ),
                    ),
                    Gap(size.height * .11),
                    Visibility(
                      visible: ref.read(bpmHearthBPMStateProvider.notifier).state > 0,
                      child: LottieBuilder.asset("assets/lottie/KzqK3fShi3.json")
                    )
                  ],
                ),
              ),
            ).animate()
              .fadeIn(
              duration: const Duration(seconds: 1),
              curve: Curves.fastEaseInToSlowEaseOut,
              delay: const Duration(milliseconds: 500),
            ),
          ],
        ),
      ),
    );
  }
}