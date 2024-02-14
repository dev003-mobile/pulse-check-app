import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../_stores/measurement_store.dart';
import '../../../../../core/presenter/common/design/app_style_design.dart';
import '../../../../../core/presenter/common/design/app_theme_design.dart';
import '../../../../../core/presenter/providers/module_providers/measurement_providers.dart';

class HeaderMeasurementComponent extends ConsumerWidget {
  const HeaderMeasurementComponent(this._store, {super.key});

  final MeasurementStore _store;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.sizeOf(context);
    ref.watch(isMeasuringStateProvider);
    ref.watch(isPressFlashStateProvider);
    ref.watch(bpmHearthBPMStateProvider);
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.only(top: size.height * .03),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: SizedBox(
                child: Text(
                  "Medir",
                  style: AppStyleDesign.fontStyleInter(
                    context: context,
                    size: size.height * .03,
                    fontWeight: FontWeight.w700,
                    color: AppThemeDesign.defaulTheme.colorScheme.background 
                  ),
                ),
              ),
            ),
            SizedBox(
              child: GestureDetector(
                onTap: () async {
                  ref.read(isPressFlashStateProvider.notifier).state ?
                    await _store.disableTorch() : await _store.enableTorch();

                  ref.read(isPressFlashStateProvider.notifier).state =
                    !(ref.read(isPressFlashStateProvider.notifier).state);
                },
                child: Padding(
                  padding: EdgeInsets.all(size.height * .01),
                  child: Icon(
                    LucideIcons.zap,
                    color: ref.read(isPressFlashStateProvider.notifier).state ?
                      AppThemeDesign.defaulTheme.colorScheme.onBackground.withOpacity(.5) : null,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
