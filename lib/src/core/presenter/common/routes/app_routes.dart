import 'package:get/get.dart';

import 'app_name_route.dart';
import '../../../../modules/main_module/screens/main_screen.dart';
import '../../../../modules/main_module/screens/filter_screen/filter_screen.dart';
import '../../../../modules/initial_module/screens/slide_screen/slide_screen.dart';
import '../../../../modules/auth_module/screens/sign_up_screen/sign_up_screen.dart';
import '../../../../modules/auth_module/screens/sign_in_screen/sign_in_screen.dart';
import '../../../../modules/initial_module/screens/splash_screen/splash_screen.dart';
import '../../../../modules/auth_module/screens/forgot_password_screen/forgot_password_screen.dart';

class AppRoutes {
  static List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    GetPage(name: AppNameRoute.splashScreen, page: () => const SplashScreen()),
    GetPage(name: AppNameRoute.slideScreen, page: () => const SlideScreen()),
    GetPage(name: AppNameRoute.signInScreen, page: () => const SignInScreen()),
    GetPage(name: AppNameRoute.signUpScreen, page: () => const SignUpScreen()),
    GetPage(name: AppNameRoute.forgotPasswordScreen, page: () => const ForgotPasswordScreen()),
    GetPage(name: AppNameRoute.mainScreen, page: () => const MainScreen()),
    GetPage(name: AppNameRoute.filterScreen, page: () => const FilterScreen()),
  ];
}