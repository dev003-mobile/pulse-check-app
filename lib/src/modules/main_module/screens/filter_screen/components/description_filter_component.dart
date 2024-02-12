import 'package:flutter/material.dart';

import '../../../../../core/presenter/common/design/app_style_design.dart';
import '../../../../../core/presenter/common/design/app_theme_design.dart';

class DescriptionFilterComponent extends StatelessWidget {
  const DescriptionFilterComponent({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: RichText(
        text: TextSpan(
          style: AppStyleDesign.fontStyleInter(
            context: context,
            size: size.height * .04,
            fontWeight: FontWeight.w700,
            color: AppThemeDesign.defaulTheme.colorScheme.background
          ),
          children: <TextSpan>[
            const TextSpan(text: "Realize filtros de\n"),
            TextSpan(
              text: "acordo a data",
              style: AppStyleDesign.fontStyleInter(
                context: context,
                size: size.height * .04,
                color: AppThemeDesign.defaulTheme.colorScheme.primary 
              )
            ),
          ]
        )
      )
    );
  }
}
