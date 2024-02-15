import 'package:gap/gap.dart';
import 'package:flutter/material.dart';

import '../design/app_style_design.dart';
import '../design/app_theme_design.dart';
import '../../utils/constants/app_image_constants.dart';

class InfoProfileDataWidget extends StatefulWidget {
  const InfoProfileDataWidget({super.key});

  @override
  State<InfoProfileDataWidget> createState() => _InfoProfileDataWidgetState();
}

class _InfoProfileDataWidgetState extends State<InfoProfileDataWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width * .42,
      height: size.height * .1,
      decoration: BoxDecoration(
        color: AppThemeDesign.defaulTheme.colorScheme.surface,
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppThemeDesign.defaulTheme.colorScheme.background.withOpacity(.03),
            blurRadius: 10,
            spreadRadius: 5
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            child: Image.asset(AppImageConstants.verifyImage),
          ),
          Gap(size.width * .06),
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "102",
                  style: AppStyleDesign.fontStyleInter(
                    context: context,
                    size: size.height * .02,
                    fontWeight: FontWeight.w700,
                    color: AppThemeDesign.defaulTheme.colorScheme.background 
                  ),
                ),
                Text(
                  "bpm",
                  style: AppStyleDesign.fontStyleInter(
                    context: context,
                    size: size.height * .014,
                    fontWeight: FontWeight.w700,
                    color: AppThemeDesign.defaulTheme.colorScheme.onBackground 
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
