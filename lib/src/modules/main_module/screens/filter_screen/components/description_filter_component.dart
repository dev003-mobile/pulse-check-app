import 'package:flutter/material.dart';

import '../../../../../core/presenter/common/design/app_style_design.dart';
import '../../../../../core/presenter/common/design/app_theme_design.dart';

class DescriptionFilterComponent extends StatelessWidget {
  const DescriptionFilterComponent({
    super.key,
    this.firstWord,
    this.secondWord
  });

  final String? firstWord;
  final String? secondWord;

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
            TextSpan(text: firstWord ?? "Realize filtros de\n"),
            TextSpan(
              text: secondWord ?? "acordo a data",
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
