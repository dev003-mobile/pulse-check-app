import 'package:flutter_riverpod/flutter_riverpod.dart';

final buttonForgotPasswordStateProvider = StateProvider<bool>((ref) => false);
final buttonForgotPasswordIsLoadingStateProvider = StateProvider<bool>((ref) => false);