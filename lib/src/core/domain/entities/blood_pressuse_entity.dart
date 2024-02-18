class BloodPressureEntity {
  final String unity;
  final String userId;
  final int measurementValue;
  final String measurementDate;
  final String measurementTime;
  final String measurementDescriptionDate;

  BloodPressureEntity({
    required this.unity,
    required this.userId,
    required this.measurementTime,
    required this.measurementDate,
    required this.measurementValue,
    required this.measurementDescriptionDate
  });
}
