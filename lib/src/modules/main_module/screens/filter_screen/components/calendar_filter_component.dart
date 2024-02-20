import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

import '../../../_stores/filter_store.dart';
import '../../../../../core/presenter/common/design/app_style_design.dart';
import '../../../../../core/presenter/common/design/app_theme_design.dart';

class CalendarFilterComponent extends StatelessWidget {
  CalendarFilterComponent({super.key});

  final FilterStore _store = GetIt.I.get<FilterStore>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: CalendarDatePicker2(
        value: const <DateTime>[],
        onValueChanged: (dates) => _store.dates = dates,
        config: CalendarDatePicker2Config(
          calendarType: CalendarDatePicker2Type.range,
          selectableDayPredicate: (date) => date.isBefore(DateTime.now(),),
          weekdayLabelTextStyle: AppStyleDesign.fontStyleInter(
            context: context,
            size: size.height * .013, 
            fontWeight: FontWeight.w500,
            color: AppThemeDesign.defaulTheme.colorScheme.primary
          ),
          lastMonthIcon: Icon(
            LucideIcons.moveLeft,
            size: size.height * .022,
          ),
          nextMonthIcon: Icon(
            LucideIcons.moveRight,
            size: size.height * .022,
          ),
        ),
        onDisplayedMonthChanged: (value) {},
      ),
    );
  }
}
