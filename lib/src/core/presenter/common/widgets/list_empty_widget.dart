import 'package:gap/gap.dart';
import 'package:flutter/material.dart';

import '../design/app_style_design.dart';
import '../design/app_theme_design.dart';
import '../../utils/constants/app_image_constants.dart';

class ListEmptyWidget extends StatelessWidget {
  const ListEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            child: Image.asset(AppImageConstants.infoImage),
          ),
          Gap(size.height * .015),
          SizedBox(
            child: Text(
              "Sem medições",
              style: AppStyleDesign.fontStyleInter(
                context: context,
                size: size.height * .016,
                fontWeight: FontWeight.bold,
                color: AppThemeDesign.defaulTheme.colorScheme.onPrimary 
              ),
            ),
          ),
          Gap(size.height * .01),
          SizedBox(
            child: Text(
              "Faça medições para serem registradas",
              style: AppStyleDesign.fontStyleInter(
                context: context,
                size: size.height * .014,
                color: AppThemeDesign.defaulTheme.colorScheme.onSecondary 
              ),
            ),
          ),
        ],
      ),
    );
  }
}
