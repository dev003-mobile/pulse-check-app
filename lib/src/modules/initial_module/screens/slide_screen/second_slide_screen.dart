import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/jump_text_component.dart';
import 'components/second_slide_component/container_info_second_slide_component.dart';

class SecondSlideScreen extends ConsumerWidget {
  const SecondSlideScreen(this._pageController, {super.key});

  final PageController _pageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * .04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            const JumpTextComponent(),
            ContainerInfoSecondSlideComponent(_pageController)
          ],
        ),
      ),
    );
  }
}
