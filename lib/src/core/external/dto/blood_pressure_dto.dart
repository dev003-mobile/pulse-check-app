import '../../domain/entities/blood_pressuse_entity.dart';

class BloodPressureDTO extends BloodPressureEntity {
  BloodPressureDTO({
    required super.unity, 
    required super.userId, 
    required super.measurementTime, 
    required super.measurementDate, 
    required super.measurementValue,
    required super.measurementDescriptionDate
  });

  factory BloodPressureDTO.fromJson(Map<String, dynamic> json) {
    return BloodPressureDTO(
      unity: json["unit"],
      userId: json["user_id"],
      measurementTime: json["measurement_time"],
      measurementDate: json["measurement_date"],
      measurementValue: json["measurement_value"],
      measurementDescriptionDate: json["measurement_description_date"]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "unit": super.unity, 
      "user_id": super.userId, 
      "measurement_time": super.measurementTime, 
      "measurement_date": super.measurementDate, 
      "measurement_value": super.measurementValue, 
      "measurement_description_date": super.measurementDescriptionDate
    };
  }
}