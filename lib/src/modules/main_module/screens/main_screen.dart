import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../_stores/main_store.dart';
import 'home_screen/home_screen.dart';
import 'profile_screen/profile_screen.dart';
import 'measurement_screen/measurement_screen.dart';
import 'components/bottom_navigation_component.dart';
import '../../../core/presenter/providers/global_providers.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  final MainStore _store = MainStore();

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
    ref.watch(isRollingProvider);
    ref.watch(currentIndexProvider);
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _store.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const <Widget>[
            HomeScreen(),
            MeasurementScreen(),
            ProfileScreen(),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: BottomNavigationComponent(_store.pageController)
    );
  }
}