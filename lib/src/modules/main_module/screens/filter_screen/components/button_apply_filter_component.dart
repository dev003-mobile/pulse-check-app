import 'package:flutter/material.dart';

import '../../../../../core/presenter/common/design/app_theme_design.dart';
import '../../../../../core/presenter/utils/constants/app_name_constant.dart';
import '../../../../../core/presenter/common/widgets/button_opacity_widget.dart';
import '../../../../../core/presenter/providers/module_providers/filter_providers.dart';

class ButtonApplyFilterComponent extends StatelessWidget {
  const ButtonApplyFilterComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ButtonOpacityWidget(
        onTap: () { },
        provider: applyFilterStateProvider,
        textButton: AppNameConstant.applyFilter,
        backgroundColor: AppThemeDesign.defaulTheme.colorScheme.primary,
      ),
    );
  }
}