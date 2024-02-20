import 'package:flutter_riverpod/flutter_riverpod.dart';

final applyFilterStateProvider = StateProvider<bool>((ref) => false);
final isFilteringMeasurementsStateProvider = StateProvider<bool>((ref) => false);