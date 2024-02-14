import 'package:blood_pressure_measurement/src/core/external/datasources/local/local_storage_datasource.dart';

class SplashStore {
  final LocalStorageDatasource _localStorageDatasource;

  SplashStore(this._localStorageDatasource);

  Future<String?> getToken(String key) async => await _localStorageDatasource.get(key);
}