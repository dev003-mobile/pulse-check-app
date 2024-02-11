import 'package:flutter/services.dart';

class DeviceGlobalConfig {
  static Future<void> setVerticalOrientation() async => 
    await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
}