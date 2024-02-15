import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../common/routes/app_routes.dart';
import '../common/routes/app_name_route.dart';
import '../common/design/app_theme_design.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      getPages: AppRoutes.routes,
      theme: AppThemeDesign.defaulTheme,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      darkTheme: AppThemeDesign.defaulTheme,
      initialRoute: AppNameRoute.splashScreen,
      transitionDuration: const Duration(milliseconds: 300),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        Locale('en', ''),
        Locale('pt', ''),
      ],
    );
  }
}