import 'package:flutter_riverpod/flutter_riverpod.dart';

final visiblePasswordStateProvider = StateProvider<bool>((ref) => true);
final buttonSignInSlideStateProvider = StateProvider<bool>((ref) => false);
final buttonSignInGoogleSlideStateProvider = StateProvider<bool>((ref) => false);