import 'package:gap/gap.dart';
import 'package:flutter/material.dart';

import '../../../../../core/domain/entities/blood_pressuse_entity.dart';
import '../../../../../core/presenter/common/design/app_style_design.dart';
import '../../../../../core/presenter/common/design/app_theme_design.dart';

class TopCardShowBPMComponent extends StatelessWidget {
  const TopCardShowBPMComponent(this.args, {super.key});

  final BloodPressureEntity args;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width,
      height: size.height * .2,
      decoration: BoxDecoration(
        color: AppThemeDesign.defaulTheme.colorScheme.primary.withOpacity(.1),
        borderRadius: const BorderRadius.all(Radius.circular(10))
      ),
      child: Padding(
        padding: EdgeInsets.all(size.height * .015),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              child: Text(
                "Resultado",
                style: AppStyleDesign.fontStyleInter(
                  context: context,
                  size: size.height * .035, 
                  fontWeight: FontWeight.bold,
                  color: AppThemeDesign.defaulTheme.colorScheme.primary
                ),
              ),
            ),
            Gap(size.height * .005),
            Container(
              width: size.width * .3,
              height: size.height * .04,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                color: AppThemeDesign.defaulTheme.colorScheme.primary.withOpacity(.2),
              ),
              child: Center(
                child: Text(
                  args.measurementDescriptionDate,
                  style: AppStyleDesign.fontStyleInter(
                    context: context,
                    size: size.height * .012,
                    fontWeight: FontWeight.bold,
                    color: AppThemeDesign.defaulTheme.colorScheme.primary 
                  ),
                ),
              ),
            ),
            Gap(size.height * .018),
            Container(
              width: size.width * .5,
              height: size.height * .04,
              padding: EdgeInsets.symmetric(horizontal: size.width * .01),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                color: AppThemeDesign.defaulTheme.colorScheme.primary.withOpacity(.2),
              ),
              child: Center(
                child: Text(
                  args.userId,
                  style: AppStyleDesign.fontStyleInter(
                    context: context,
                    size: size.height * .012,
                    fontWeight: FontWeight.bold,
                    color: AppThemeDesign.defaulTheme.colorScheme.primary 
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
