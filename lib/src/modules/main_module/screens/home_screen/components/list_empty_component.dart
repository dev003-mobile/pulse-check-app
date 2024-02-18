import 'package:gap/gap.dart';
import 'package:flutter/material.dart';

import '../../../../../core/presenter/common/design/app_style_design.dart';
import '../../../../../core/presenter/common/design/app_theme_design.dart';
import '../../../../../core/presenter/utils/constants/app_image_constants.dart';

class ListEmptyComponent extends StatelessWidget {
  const ListEmptyComponent({super.key});

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
              "Faça a sua primeira medição para ser registrada",
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
