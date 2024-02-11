import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/third_slide_component/container_info_third_slide_component.dart';

class ThirdSlideScreen extends ConsumerWidget {
  const ThirdSlideScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * .04),
        child: const ContainerInfoThirdSlideComponent(),
      ),
    );
  }
}
