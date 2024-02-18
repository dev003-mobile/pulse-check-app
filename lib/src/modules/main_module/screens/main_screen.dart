import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../_stores/main_store.dart';
import 'home_screen/home_screen.dart';
import 'profile_screen/profile_screen.dart';
import 'measurement_screen/measurement_screen.dart';
import 'components/bottom_navigation_component.dart';
import '../../../core/presenter/providers/global_providers.dart';

class MainScreen extends ConsumerStatefulWidget {
  MainScreen({super.key});

  final MainStore _store = GetIt.I.get<MainStore>();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  @override
  Widget build(BuildContext context) {
    ref.watch(isRollingProvider);
    ref.watch(currentIndexProvider);
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: widget._store.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            HomeScreen(),
            const MeasurementScreen(),
            ProfileScreen(),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: BottomNavigationComponent()
    );
  }
}