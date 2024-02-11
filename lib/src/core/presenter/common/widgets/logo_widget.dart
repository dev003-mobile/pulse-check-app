import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/constants/app_image_constants.dart';

class LogoWidget extends ConsumerWidget {
  const LogoWidget({super.key, this.scale});

  final double? scale;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      child: Image.asset(
        scale: scale,
        AppImageConstants.iconApp
      ),
    );
  }
}
