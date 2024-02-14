import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageDatasource {
  Future<String?> get(String key) async {
    final instance = await SharedPreferences.getInstance();
    try {
      return instance.getString(key);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> put(String key, String value) async {
    final instance = await SharedPreferences.getInstance();
    try {
      return instance.setString(key, value);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}