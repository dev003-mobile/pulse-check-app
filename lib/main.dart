import "package:flutter/material.dart";
import 'package:flutter_animate/flutter_animate.dart';

import 'src/core/presenter/app/app_widget.dart';
import 'src/core/presenter/config/device_global_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Animate.restartOnHotReload = true;
  DeviceGlobalConfig.setVerticalOrientation();
  runApp(const AppWidget());
}
