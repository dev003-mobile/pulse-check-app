import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/header_measurement_component.dart';
import 'components/section_measurement_component.dart';
import 'components/result_bpm_measurement_component.dart';
import '../../../../core/presenter/providers/module_providers/measurement_providers.dart';

class MeasurementScreen extends ConsumerStatefulWidget {
  const MeasurementScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MeasurementScreenState();
}

class _MeasurementScreenState extends ConsumerState<MeasurementScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    ref.watch(isMeasuringStateProvider);
    return SizedBox(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * .04),
          child: Visibility(
            visible: ref.read(isMeasuringStateProvider.notifier).state,
            replacement: Column(
              children: <Widget>[
                HeaderMeasurementComponent(),
                const SectionMeasurementComponent()
              ],
            ),
            child: ResultBPMMeasurementComponent()
          ),
        )
      ),
    );
  }
}