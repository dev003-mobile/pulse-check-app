import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../design/app_style_design.dart';
import '../design/app_theme_design.dart';

class BoottomItemWidget extends ConsumerWidget {
  const BoottomItemWidget({
    super.key,
    this.icon,
    this.onTap,
    required this.title,
    this.selected = false,
  });

  final String title;
  final bool selected;
  final IconData? icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: size.height * .011),
        child: GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.height * .016),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(child: Icon(
                  icon ?? Icons.add,
                  color: selected ?
                    AppThemeDesign.defaulTheme.colorScheme.surface : null,
                )),
                Gap(size.height * .01),
                Text(
                  title,
                  style: AppStyleDesign.fontStyleInter(
                    context: context,
                    size: size.height * .0125,
                    fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
                    color: selected ? 
                      AppThemeDesign.defaulTheme.colorScheme.surface : 
                      AppThemeDesign.defaulTheme.colorScheme.background 
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}