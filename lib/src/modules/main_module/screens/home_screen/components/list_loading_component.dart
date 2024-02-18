import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

import '../../../../../core/presenter/common/design/app_theme_design.dart';
import '../../../../../core/presenter/common/widgets/skeleton_widget.dart';

class ListLoadingComponent extends StatelessWidget {
  const ListLoadingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Shimmer.fromColors(
      period: const Duration(seconds: 2),
      direction: ShimmerDirection.ltr,
      highlightColor: AppThemeDesign.defaulTheme.colorScheme.surface,
      baseColor: AppThemeDesign.defaulTheme.colorScheme.onBackground.withOpacity(.08),
      child: ListView.builder(
        itemCount: 4,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: size.height * .02),
        itemBuilder: (_, index) => const SkeletonWidget()
      ),
    );
  }
}
