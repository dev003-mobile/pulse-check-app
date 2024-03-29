import 'package:dartz/dartz.dart';

import '../../domain/entities/blood_pressuse_entity.dart';
import '../../domain/entities/filter_blood_pressure_entity.dart';
import '../../domain/repositories/i_blood_pressure_repository.dart';
import '../datasources/contracts/i_blood_pressure_datasource.dart';

class BloodPressureRepositoryImp implements IBloodPressureRepository {
  final IBloodPressureDatasource _pressureDatasource;

  BloodPressureRepositoryImp(this._pressureDatasource);

  @override
  Future<BloodPressureEntity> createMeasurement(BloodPressureEntity bloodPressureEntity) async => 
    await _pressureDatasource.createMeasurement(bloodPressureEntity);

  @override
  Future<Either<Exception, bool>> deleteMeasurement(String pk) async => await _pressureDatasource.deleteMeasurement(pk);

  @override
  Future<List<BloodPressureEntity>> getAllMeasurements() async => await _pressureDatasource.getAllMeasurements();
  
  @override
  Future<int> getTotalBPM(String userId) async => await _pressureDatasource.getTotalBPM(userId);
  
  @override
  Future<int> getCountMeasurement(String userId) async => await _pressureDatasource.getCountMeasurement(userId);
  
  @override
  Future<List<BloodPressureEntity>> getDataRangeFilter(FilterBloodPressureEntity filter) async => 
    await _pressureDatasource.getDataRangeFilter(filter);
}