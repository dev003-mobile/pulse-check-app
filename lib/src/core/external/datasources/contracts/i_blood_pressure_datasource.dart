import 'package:dartz/dartz.dart';

import '../../../domain/entities/blood_pressuse_entity.dart';

abstract class IBloodPressureDatasource {
  Future<List<BloodPressureEntity>> getAllMeasurements();
  Future<Either<Exception, bool>> deleteMeasurement(String pk);
  Future<BloodPressureEntity> createMeasurement(BloodPressureEntity bloodPressureEntity);
}