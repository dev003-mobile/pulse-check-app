import "package:flutter/material.dart";

import 'src/core/presenter/app/app_widget.dart';
import 'src/core/presenter/config/device_global_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DeviceGlobalConfig.setVerticalOrientation();
  runApp(const AppWidget());
}
