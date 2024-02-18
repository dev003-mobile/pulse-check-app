import 'package:gap/gap.dart';
import 'package:flutter/material.dart';

import '../design/app_style_design.dart';
import '../design/app_theme_design.dart';
import '../../../domain/entities/blood_pressuse_entity.dart';

class StateResultBPMWidget extends StatelessWidget {
  const StateResultBPMWidget({
    super.key, 
    required this.data,
    required this.title,
    required this.color,
    this.isActive = false,
    required this.rangeBPM,
  });

  final Color color;
  final String title;
  final bool isActive;
  final String rangeBPM;
  final BloodPressureEntity data;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return                             SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: size.height * .004,
                  backgroundColor: color,
                ),
                Gap(size.width * .02),
                Text(
                  title,
                  style: AppStyleDesign.fontStyleInter(
                    context: context,
                    size: size.height * .018, 
                    fontWeight: isActive ? FontWeight.bold : FontWeight.w300,
                    color: isActive ? 
                      AppThemeDesign.defaulTheme.colorScheme.background :
                      AppThemeDesign.defaulTheme.colorScheme.background.withOpacity(.5)
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            child: Text(
              "$rangeBPM ${data.unity.toUpperCase()}",
              style: AppStyleDesign.fontStyleInter(
                context: context,
                size: size.height * .018, 
                fontWeight: isActive ? FontWeight.bold : FontWeight.w300,
                color: isActive ? 
                  AppThemeDesign.defaulTheme.colorScheme.background :
                  AppThemeDesign.defaulTheme.colorScheme.background.withOpacity(.5)
              ),
            ),
          )
        ],
      ),
    );
  }
}
