import 'package:flutter_riverpod/flutter_riverpod.dart';

final buttonSignInStateProvider = StateProvider<bool>((ref) => false);
final visiblePasswordStateProvider = StateProvider<bool>((ref) => true);
final buttonSignInIsLoadingStateProvider = StateProvider<bool>((ref) => false);
final buttonSignInGoogleSlideStateProvider = StateProvider<bool>((ref) => false);