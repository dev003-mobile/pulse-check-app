import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../_stores/measurement_store.dart';
import '../../../../../core/domain/entities/blood_pressuse_entity.dart';
import '../../../../../core/presenter/common/routes/app_name_route.dart';
import '../../../../../core/presenter/common/design/app_theme_design.dart';
import '../../../../../core/presenter/utils/constants/app_name_constant.dart';
import '../../../../../core/presenter/common/widgets/button_opacity_widget.dart';
import '../../../../../core/presenter/common/widgets/render_message_info_widget.dart';
import '../../../../../core/presenter/providers/module_providers/measurement_providers.dart';

class ButtonDeleteMeasurementComponent extends ConsumerStatefulWidget {
  ButtonDeleteMeasurementComponent(this.args, {super.key});

  final BloodPressureEntity args;
  final MeasurementStore _store = GetIt.I.get<MeasurementStore>();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ButtonDeleteMeasurementComponentState();
}

class _ButtonDeleteMeasurementComponentState extends ConsumerState<ButtonDeleteMeasurementComponent> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    ref.watch(buttonDeleteMeasurementIsLoadingStateProvider);
    return SizedBox(
      child: ButtonOpacityWidget(
        onTap: () async { 
          ref.read(buttonDeleteMeasurementIsLoadingStateProvider.notifier).state = true;
          await widget._store.deleteMeasurement(widget.args.id!).then((result) async {
            result.fold(
              (error) => RenderMessageInfo.render(
                context: context,
                size: size.height * .016, 
                message: error.toString(), 
              ), 
              (success) async {
                RenderMessageInfo.render(
                  context: context,
                  size: size.height * .016, 
                  message: "Deletado com sucesso", 
                  color: AppThemeDesign.defaulTheme.colorScheme.primary
                );
                await Future.delayed(const Duration(seconds: 3), () {
                  Get.offAllNamed(AppNameRoute.mainScreen);
                });
                ref.read(buttonDeleteMeasurementIsLoadingStateProvider.notifier).state = false;
              }
            );
          });
          ref.read(buttonDeleteMeasurementIsLoadingStateProvider.notifier).state = false;
        },
        textButton: AppNameConstant.deleteText,
        provider: buttonDeleteMeasurementStateProvider,
        backgroundColor: AppThemeDesign.defaulTheme.colorScheme.error,
        isLoading: ref.read(buttonDeleteMeasurementIsLoadingStateProvider.notifier).state,
      ),
    );
  }
}