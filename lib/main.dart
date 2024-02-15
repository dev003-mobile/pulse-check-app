import 'package:get_it/get_it.dart';

import 'firebase_options.dart';
import "package:flutter/material.dart";
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/core/presenter/app/app_widget.dart';
import 'src/core/presenter/config/device_global_config.dart';
import 'src/core/presenter/utils/injections/injections.dart';
import 'src/core/external/datasources/local/local_storage_datasource.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Animate.restartOnHotReload = true;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Injections.initialize();
  DeviceGlobalConfig.setVerticalOrientation();
  await GetIt.I<LocalStorageDatasource>().initialize();
  runApp(const ProviderScope(child: AppWidget()));
}
