import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class CalendarFilterComponent extends StatelessWidget {
  const CalendarFilterComponent({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: CalendarDatePicker2(
        value: const <DateTime>[],
        onValueChanged: (dates) {},
        config: CalendarDatePicker2Config(
          calendarType: CalendarDatePicker2Type.range,
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
