import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../_stores/slide_store.dart';
import 'components/smooth_page_component.dart';
import 'components/container_slides_component.dart';

class SlideScreen extends ConsumerStatefulWidget {
  const SlideScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SlideScreenState();
}

class _SlideScreenState extends ConsumerState<SlideScreen> {
  final SlideStore _store = SlideStore();

  @override
  void initState() {
    super.initState();
    _store.pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _store.pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Center(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              ContainerSlidesComponent(_store.pageController),
              SmoothPageComponent(_store.pageController)
            ],
          ),
        ),
      ),
    );
  }
}