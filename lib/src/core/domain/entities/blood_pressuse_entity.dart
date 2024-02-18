class BloodPressureEntity {
  final String? id;
  final String unity;
  final String userId;
  final int measurementValue;
  final String measurementDate;
  final String measurementTime;
  final String measurementDescriptionDate;

  BloodPressureEntity({
    this.id,
    required this.unity,
    required this.userId,
    required this.measurementTime,
    required this.measurementDate,
    required this.measurementValue,
    required this.measurementDescriptionDate
  });
}
