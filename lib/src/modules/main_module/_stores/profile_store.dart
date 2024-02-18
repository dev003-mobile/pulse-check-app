import 'dart:convert';

import '../../../core/domain/entities/user_entity.dart';
import '../../../core/domain/usecases/user_usecases/user_sign_out_usecase.dart';
import '../../../core/external/datasources/local/local_storage_datasource.dart';
import '../../../core/domain/usecases/user_usecases/user_get_update_usecase.dart';
import '../../../core/domain/usecases/blood_pressure_usecases/get_total_bpm_usecase.dart';
import '../../../core/domain/usecases/blood_pressure_usecases/get_count_measurement_usecase.dart';

class ProfileStore {
  final UserSignOutUseCase _signOutUseCase;
  final GetTotalBPMUseCase _totalBPMUseCase;
  final UserGetUpdateUseCase _getUpdateUseCase;
  final LocalStorageDatasource _storageDatasource;
  final GetCountMeasurementUseCase _countMeasurementUseCase;

  ProfileStore(
    this._signOutUseCase, this._getUpdateUseCase, 
    this._storageDatasource, this._totalBPMUseCase,
    this._countMeasurementUseCase
  );

  late UserEntity data;

  Future<void> endSession() async => await _signOutUseCase();
  Future<void> updateUserData(UserEntity entity) async => await _getUpdateUseCase(entity); 

  UserEntity getUser() {
    final String? user = _storageDatasource.get("user");
    final Map<String, dynamic> parseMap = jsonDecode(user!) as Map<String, dynamic>;
    return UserEntity.fromJson(parseMap);
  }

  Future<int> getTotalBPM(String userId) async => await _totalBPMUseCase(userId);
  Future<int> getCountMeasurement(String userId) async => await _countMeasurementUseCase(userId);
}