import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../_stores/filter_store.dart';
import '../../../../../core/external/dto/filter_blood_pressure_dto.dart';
import '../../../../../core/presenter/common/routes/app_name_route.dart';
import '../../../../../core/presenter/common/design/app_theme_design.dart';
import '../../../../../core/presenter/utils/constants/app_name_constant.dart';
import '../../../../../core/presenter/common/widgets/button_opacity_widget.dart';
import '../../../../../core/presenter/common/widgets/render_message_info_widget.dart';
import '../../../../../core/presenter/providers/module_providers/filter_providers.dart';

class ButtonApplyFilterComponent extends ConsumerWidget {
  ButtonApplyFilterComponent({super.key});

  final FilterStore _store = GetIt.I.get<FilterStore>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.sizeOf(context);
    ref.watch(isFilteringMeasurementsStateProvider);
    return SizedBox(
      child: ButtonOpacityWidget(
        onTap: () async {
          if (_store.dates.isEmpty) {
            return RenderMessageInfo.render(
              context: context,
              size: size.height * .016, 
              message: "Selecione um dia ou um intervalo de dias", 
              color: AppThemeDesign.defaulTheme.colorScheme.error
            );
          } else {
            ref.read(isFilteringMeasurementsStateProvider.notifier).state = true;
            await _store.getFilter(FilterBloodPressureDTO(
              startDate: _store.dates[0]?.toString().split(" ")[0],
              endDate: _store.dates.length == 2 ? 
                _store.dates[1]?.toString().split(" ")[0] : 
                _store.dates[0]?.toString().split(" ")[0]
            )).then((measurements) {
              ref.read(isFilteringMeasurementsStateProvider.notifier).state = false;
              Get.toNamed(
              AppNameRoute.filteredDataScreen,
                arguments: measurements
              );
            });
            ref.read(isFilteringMeasurementsStateProvider.notifier).state = false;
          }
        },
        provider: applyFilterStateProvider,
        textButton: AppNameConstant.applyFilter,
        backgroundColor: AppThemeDesign.defaulTheme.colorScheme.primary,
        isLoading: ref.read(isFilteringMeasurementsStateProvider.notifier).state,
      ),
    );
  }
}