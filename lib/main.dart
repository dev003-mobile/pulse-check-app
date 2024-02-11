import "package:flutter/material.dart";
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/core/presenter/app/app_widget.dart';
import 'src/core/presenter/config/device_global_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Animate.restartOnHotReload = true;
  DeviceGlobalConfig.setVerticalOrientation();
  runApp(const ProviderScope(child: AppWidget()));
}
