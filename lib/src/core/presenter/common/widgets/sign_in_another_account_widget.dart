import 'package:flutter/material.dart';

import '../design/app_style_design.dart';
import '../design/app_theme_design.dart';
import '../../utils/constants/app_name_constant.dart';

class SignInAnotherAccountWidget extends StatelessWidget {
  const SignInAnotherAccountWidget({super.key, this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: Row(
        children: <Widget>[
          const Expanded(
            flex: 1,
            child: Divider()
          ),
          SizedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .03),
              child: Text(
                text ?? AppNameConstant.signInAnotherAccountText,
                style: AppStyleDesign.fontStyleInter(
                  context: context,
                  size: size.height * .014,
                  fontWeight: FontWeight.w500,
                  color: AppThemeDesign.defaulTheme.colorScheme.onBackground 
                ),
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: Divider()
          ),
        ],
      ),
    );
  }
}
