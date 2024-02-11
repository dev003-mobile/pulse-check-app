import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../first_slide_screen.dart';
import '../third_slide_screen.dart';
import '../second_slide_screen.dart';

class ContainerSlidesComponent extends ConsumerWidget {
  const ContainerSlidesComponent(this._pageController, {super.key});

  final PageController _pageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      child: PageView(
        controller: _pageController,
        physics: const ClampingScrollPhysics(),
        children: <Widget>[
          FirstSlideScreen(_pageController),
          SecondSlideScreen(_pageController),
          const ThirdSlideScreen(),
        ],
      ),
    );
  }
}
