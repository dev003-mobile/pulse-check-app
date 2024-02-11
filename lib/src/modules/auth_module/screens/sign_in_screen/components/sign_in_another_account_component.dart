import 'package:flutter/material.dart';

import '../../../../../core/presenter/common/design/app_style_design.dart';
import '../../../../../core/presenter/common/design/app_theme_design.dart';
import '../../../../../core/presenter/utils/constants/app_name_constant.dart';

class SignInAnotherAccountComponent extends StatelessWidget {
  const SignInAnotherAccountComponent({super.key});

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
                AppNameConstant.signInAnotherAccountText,
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
