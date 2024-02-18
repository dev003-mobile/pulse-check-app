import "package:intl/intl.dart";

import "months_local_datasource.dart";

class CurrentDateLocalDatasource {
  final MonthsLocalDatasource _monthLocal = MonthsLocalDatasource();

  DateTime currentDate = DateTime.now();

  String getTime() {
    String formattedTime = DateFormat("HH:mm:ss").format(currentDate);
    return formattedTime;
  }

  String getDate() {
    String formattedDate = DateFormat("yyyy-MM-dd").format(currentDate);
    return formattedDate;
  }

  String monthAbbreviation() => _monthLocal.getMonth(currentDate.month)!.substring(0, 3);

  String getDescriptionDate() => "${_monthLocal.getMonth(currentDate.month)}, ${currentDate.day} de ${currentDate.year}";
}