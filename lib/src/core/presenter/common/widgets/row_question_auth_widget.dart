import 'package:flutter/material.dart';

import '../design/app_style_design.dart';
import '../design/app_theme_design.dart';

class RowQuestionAuthWidget extends StatelessWidget {
  const RowQuestionAuthWidget({
    super.key,
    this.onTap,
    required this.question,
    required this.actionText
  });

  final String question;
  final String actionText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            child: Text(
              "$question ",
              style: AppStyleDesign.fontStyleInter(
                context: context,
                size: size.height * .014,
                fontWeight: FontWeight.w500,
                color: AppThemeDesign.defaulTheme.colorScheme.onBackground 
              ),
            ),
          ),
          SizedBox(
            child: InkWell(
              onTap: onTap,
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              child: Padding(
                padding: EdgeInsets.all(size.height * .003),
                child: Text(
                  actionText,
                  style: AppStyleDesign.fontStyleInter(
                    context: context,
                    size: size.height * .014,
                    fontWeight: FontWeight.w500,
                    color: AppThemeDesign.defaulTheme.colorScheme.primary 
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
