import 'package:heart_bpm/heart_bpm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bpmHearthBPMStateProvider = StateProvider<int>((ref) => 0);
final isPressFlashStateProvider = StateProvider<bool>((ref) => true);
final isMeasuringStateProvider = StateProvider<bool>((ref) => false);
final showDialogShownStateProvider = StateProvider<bool>((ref) => false);
final buttonCloseModalStateProvider = StateProvider<bool>((ref) => false);
final dataHearthBPMStateProvider = StateProvider<List<SensorValue>>((ref) => []);