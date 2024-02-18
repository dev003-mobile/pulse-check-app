import 'package:dartz/dartz.dart';

import '../entities/blood_pressuse_entity.dart';

abstract class IBloodPressureRepository {
  Future<List<BloodPressureEntity>> getAllMeasurements();
  Future<Either<Exception, bool>> deleteMeasurement(String pk);
  Future<BloodPressureEntity> createMeasurement(BloodPressureEntity bloodPressureEntity);
}