import '../../domain/entities/filter_blood_pressure_entity.dart';

class FilterBloodPressureDTO extends FilterBloodPressureEntity {
  FilterBloodPressureDTO({
    super.startDate,
    super.endDate
  });

  FilterBloodPressureDTO copyWith({
    String? startDate,
    String? endDate,
  }) => 
  FilterBloodPressureDTO(
    startDate: startDate ?? this.startDate,
    endDate: endDate ?? this.endDate,
  );

  factory FilterBloodPressureDTO.fromJson(Map<String, dynamic> json) => FilterBloodPressureDTO(
    startDate: json["start_date"],
    endDate: json["end_date"]
  );

  Map<String, dynamic> toJson() => {
    "start_date": startDate,
    "end_date": endDate 
  };
}