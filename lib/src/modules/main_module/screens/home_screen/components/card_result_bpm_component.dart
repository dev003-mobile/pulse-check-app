import 'package:gap/gap.dart';
import 'package:flutter/material.dart';

import '../../../../../core/domain/entities/blood_pressuse_entity.dart';
import '../../../../../core/presenter/common/design/app_style_design.dart';
import '../../../../../core/presenter/common/design/app_theme_design.dart';
import '../../../../../core/presenter/common/widgets/state_result_bpm_widget.dart';

class CardResultBPMComponent extends StatelessWidget {
  const CardResultBPMComponent(this.args, {super.key});

  final BloodPressureEntity args;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width,
      height: size.height * .18,
      decoration: BoxDecoration(
        color: AppThemeDesign.defaulTheme.colorScheme.surface,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(
          color: AppThemeDesign.defaulTheme.colorScheme.background.withOpacity(.05)
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 20,
            spreadRadius: 10,
            color: AppThemeDesign.defaulTheme.colorScheme.onBackground.withOpacity(.02)
          )
        ]
      ), 
      child: Padding(
        padding: EdgeInsets.all(size.height * .015),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              child: Text(
                "O resultado é:",
                style: AppStyleDesign.fontStyleInter(
                  context: context,
                  size: size.height * .02, 
                  fontWeight: FontWeight.w500,
                  color: AppThemeDesign.defaulTheme.colorScheme.background
                ),
              ),
            ),
            Gap(size.height * .015),
            Container(
              width: size.width,
              height: size.height * .001,
              color: AppThemeDesign.defaulTheme.colorScheme.onBackground.withOpacity(.2),
            ),
            Gap(size.height * .015),
            StateResultBPMWidget(
              data: args,
              title: "Lento",
              rangeBPM: "<60",
              isActive: args.measurementValue < 60,
              color: AppThemeDesign.defaulTheme.colorScheme.primaryContainer,
            ),
            Gap(size.height * .002),
            StateResultBPMWidget(
              data: args,
              title: "Normal",
              rangeBPM: "60-100",
              isActive: args.measurementValue >= 60 && args.measurementValue < 100,
              color: AppThemeDesign.defaulTheme.colorScheme.secondaryContainer,
            ),
            Gap(size.height * .002),
            StateResultBPMWidget(
              data: args,
              title: "Rápido",
              rangeBPM: ">100",
              isActive: args.measurementValue > 100,
              color: AppThemeDesign.defaulTheme.colorScheme.tertiaryContainer,
            ),
          ],
        ),
      ),
    );
  }
}
