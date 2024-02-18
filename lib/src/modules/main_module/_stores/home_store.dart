import 'dart:async';
import 'dart:convert';

import '../../../core/domain/entities/user_entity.dart';
import '../../../core/domain/entities/blood_pressuse_entity.dart';
import '../../../core/external/datasources/local/local_storage_datasource.dart';
import '../../../core/domain/usecases/blood_pressure_usecases/get_all_measurement_usecase.dart';

class HomeStore {
  final LocalStorageDatasource _storageDatasource;
  final GetAllMeasurementUseCase _getAllMeasurementUseCase;

  HomeStore(this._storageDatasource, this._getAllMeasurementUseCase);

  UserEntity? data;

  UserEntity getUser() {
    final String? user = _storageDatasource.get("user");
    final Map<String, dynamic> parseMap = jsonDecode(user!) as Map<String, dynamic>;
    return UserEntity.fromJson(parseMap);
  }
  
  Future<List<BloodPressureEntity>> allMeasurements() async => await _getAllMeasurementUseCase();
}