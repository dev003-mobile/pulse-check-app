import 'dart:async';

import 'package:torch_light/torch_light.dart';

class MeasurementStore {
  Future<void> enableTorch() async => await TorchLight.enableTorch();
  Future<void> disableTorch() async => await TorchLight.disableTorch();
  Future<bool> hasTorchAvailable() async => await TorchLight.isTorchAvailable();
}