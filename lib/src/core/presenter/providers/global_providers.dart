import 'package:flutter_riverpod/flutter_riverpod.dart';

final isRollingProvider = StateProvider<bool>((ref) => true);
final currentIndexProvider = StateProvider<int>((ref) => 0);