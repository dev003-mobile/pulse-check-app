import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'components/card_result_bpm_component.dart';
import 'components/top_card_show_bpm_component.dart';
import 'components/animation_image_bpm_component.dart';
import 'components/button_delete_measurement_component.dart';
import '../../../../core/domain/entities/blood_pressuse_entity.dart';
import '../../../../core/presenter/common/widgets/icon_back_widget.dart';

class MeasurementDetailsScreen extends StatefulWidget {
  const MeasurementDetailsScreen({super.key});

  @override
  State<MeasurementDetailsScreen> createState() => _MeasurementDetailsScreenState();
}

class _MeasurementDetailsScreenState extends State<MeasurementDetailsScreen> {
  final BloodPressureEntity args = Get.arguments as BloodPressureEntity;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: size.height * .03,
            horizontal: size.width * .04
          ),
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconBackWidget(onTap: () => Get.back()),
                    Gap(size.height * .03),
                    TopCardShowBPMComponent(args),
                    Gap(size.height * .04),
                    CardResultBPMComponent(args),
                    Gap(size.height * .03),
                    ButtonDeleteMeasurementComponent(args)
                  ],
                ),
              ),
              AnimationImageBPMComponent(args)
            ],
          ),
        ),
      ) 
    );
  }
}