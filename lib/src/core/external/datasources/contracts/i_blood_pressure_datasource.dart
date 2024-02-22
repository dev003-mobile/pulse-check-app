import 'package:dartz/dartz.dart';

import '../../../domain/entities/blood_pressuse_entity.dart';
import '../../../domain/entities/filter_blood_pressure_entity.dart';

abstract class IBloodPressureDatasource {
  Future<int> getTotalBPM(String userId);
  Future<int> getCountMeasurement(String userId);
  Future<Either<Exception, bool>> deleteMeasurement(String pk);
  Future<List<BloodPressureEntity>> getAllMeasurements();
  Future<List<BloodPressureEntity>> getDataRangeFilter(FilterBloodPressureEntity filter);
  Future<BloodPressureEntity> createMeasurement(BloodPressureEntity bloodPressureEntity);
}