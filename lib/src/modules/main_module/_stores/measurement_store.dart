import 'dart:async';
import 'dart:convert';

import 'package:torch_light/torch_light.dart';

import '../../../core/domain/entities/user_entity.dart';
import '../../../core/domain/entities/blood_pressuse_entity.dart';
import '../../../core/external/datasources/local/current_date_local_datasource.dart';
import '../../../core/external/datasources/local/local_storage_datasource.dart';
import '../../../core/domain/usecases/blood_pressure_usecases/create_measurement_usecase.dart';

class MeasurementStore {
  final LocalStorageDatasource _storageDatasource;
  final CurrentDateLocalDatasource _dateLocalDatasource;
  final CreateMeasurementUseCase _createMeasurementUseCase;

  MeasurementStore(this._storageDatasource, this._createMeasurementUseCase, this._dateLocalDatasource);

  Future<void> enableTorch() async {
    try {
      await TorchLight.enableTorch();
    } catch (e) {
      return;
    }
  }
  Future<void> disableTorch() async {
    try {
      await TorchLight.disableTorch();
    } catch (e) {
      return;
    }
  }

  UserEntity? data;

  UserEntity getUser() {
    final String? user = _storageDatasource.get("user");
    final Map<String, dynamic> parseMap = jsonDecode(user!) as Map<String, dynamic>;
    return UserEntity.fromJson(parseMap);
  }

  String getCurrentTime() => _dateLocalDatasource.getTime();
  String getCurrentDate() => _dateLocalDatasource.getDate();
  String getCurrentDescriptionDate() => _dateLocalDatasource.getDescriptionDate();
  
  Future<BloodPressureEntity> createMeasurement(BloodPressureEntity bloodPressureEntity) async => await _createMeasurementUseCase(bloodPressureEntity);
}
