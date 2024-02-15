import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/jump_text_component.dart';
import 'components/first_slide_component/container_info_first_slide_component.dart';

class FirstSlideScreen extends ConsumerWidget {
  const FirstSlideScreen({super.key});

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
            ContainerInfoFirstSlideComponent(),
          ],
        ),
      ),
    );
  }
}
