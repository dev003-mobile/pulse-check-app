import 'package:get/get.dart';

import 'app_name_route.dart';
import '../../../../modules/initial_module/screens/slide_screen/slide_screen.dart';
import '../../../../modules/initial_module/screens/splash_screen/splash_screen.dart';

class AppRoutes {
  static List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    GetPage(name: AppNameRoute.splashScreen, page: () => const SplashScreen()),
    GetPage(name: AppNameRoute.slideScreen, page: () => const SlideScreen()),
  ];
}