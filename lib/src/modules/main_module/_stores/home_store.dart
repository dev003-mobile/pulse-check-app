import 'dart:convert';

import '../../../core/domain/entities/user_entity.dart';
import '../../../core/external/datasources/local/local_storage_datasource.dart';

class HomeStore {
  final LocalStorageDatasource _storageDatasource;

  HomeStore(this._storageDatasource);

  late UserEntity data;

  UserEntity getUser() {
    final String? user = _storageDatasource.get("user");
    final Map<String, dynamic> parseMap = jsonDecode(user!) as Map<String, dynamic>;
    return UserEntity.fromJson(parseMap);
  }
}