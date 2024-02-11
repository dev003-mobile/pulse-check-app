import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/presenter/common/widgets/logo_widget.dart';
import '../../../../core/presenter/common/routes/app_name_route.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) Get.offNamed(AppNameRoute.slideScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const LogoWidget()
          .animate()
          .moveX(
            begin: 300,
            duration: const Duration(seconds: 1),
            curve: Curves.fastEaseInToSlowEaseOut
          )
      )
    );
  }
}