import 'package:flutter_riverpod/flutter_riverpod.dart';

final buttonSignUpStateProvider = StateProvider<bool>((ref) => false);
final visiblePasswordStateProvider = StateProvider<bool>((ref) => true);
final visibleConfirmPasswordStateProvider = StateProvider<bool>((ref) => true);