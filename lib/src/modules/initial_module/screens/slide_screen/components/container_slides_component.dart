import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../first_slide_screen.dart';
import '../third_slide_screen.dart';
import '../second_slide_screen.dart';
import '../../../_stores/slide_store.dart';

class ContainerSlidesComponent extends ConsumerWidget {
  ContainerSlidesComponent({super.key});

  final SlideStore _store = GetIt.I.get<SlideStore>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      child: PageView(
        controller: _store.pageController,
        physics: const ClampingScrollPhysics(),
        children: const <Widget>[
          FirstSlideScreen(),
          SecondSlideScreen(),
          ThirdSlideScreen(),
        ],
      ),
    );
  }
}
