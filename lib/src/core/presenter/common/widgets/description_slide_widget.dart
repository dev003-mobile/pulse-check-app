import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../design/app_style_design.dart';
import '../design/app_theme_design.dart';

class DescriptionSlideWidget extends ConsumerWidget {
  const DescriptionSlideWidget({
    super.key,
    required this.title,
    required this.description
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: Column(
        children: <Widget>[
          SizedBox(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: AppStyleDesign.fontStyleInter(
                context: context,
                size: size.height * .03,
                fontWeight: FontWeight.w900,
                color: AppThemeDesign.defaulTheme.colorScheme.primary 
              ),
            ),
          ),
          Gap(size.height * .028),
          SizedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .04),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: AppStyleDesign.fontStyleInter(
                  context: context,
                  size: size.height * .015,
                  height: size.height * .002,
                  fontWeight: FontWeight.w400,
                  color: AppThemeDesign.defaulTheme.colorScheme.background 
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
