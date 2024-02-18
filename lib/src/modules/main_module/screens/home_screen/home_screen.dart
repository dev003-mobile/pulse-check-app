import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../_stores/home_store.dart';
import 'components/card_date_component.dart';
import 'components/header_home_component.dart';
import 'components/list_measurements_component.dart';

class HomeScreen extends ConsumerStatefulWidget {
  HomeScreen({super.key});

  final HomeStore _store = GetIt.I.get<HomeStore>();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    widget._store.data = widget._store.getUser();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * .04),
          child: Column(
            children: <Widget>[
              HeaderHomeComponent(widget._store.data),
              Gap(size.height * .04),
              CardDateComponent(),
              Gap(size.height * .005),
              ListMeasurementsComponent()
            ],
          ),
        ),
      ),
    );
  }
}
