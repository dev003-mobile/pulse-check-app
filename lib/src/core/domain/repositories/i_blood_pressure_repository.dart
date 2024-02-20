import 'package:dartz/dartz.dart';

import '../entities/blood_pressuse_entity.dart';
import '../entities/filter_blood_pressure_entity.dart';

abstract class IBloodPressureRepository {
  Future<int> getTotalBPM(String userId);
  Future<int> getCountMeasurement(String userId);
  Future<List<BloodPressureEntity>> getAllMeasurements();
  Future<Either<Exception, bool>> deleteMeasurement(String pk);
  Future<List<BloodPressureEntity>> getDataRangeFilter(FilterBloodPressureEntity filter);
  Future<BloodPressureEntity> createMeasurement(BloodPressureEntity bloodPressureEntity);
}