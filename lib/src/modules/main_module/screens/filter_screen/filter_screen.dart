import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/calendar_filter_component.dart';
import 'components/description_filter_component.dart';
import 'components/button_apply_filter_component.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SizedBox(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: size.height * .03,
            horizontal: size.width * .04
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const DescriptionFilterComponent(),
              Gap(size.height * .03),
              CalendarFilterComponent(),
              ButtonApplyFilterComponent()
            ],
          )),
        ),
      ),
    );
  }
}
