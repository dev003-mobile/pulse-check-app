import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageDatasource {
  late SharedPreferences preferences;

  Future<void> initialize() async => preferences = await SharedPreferences.getInstance();

  String? get(String key) {
    try {
      return preferences.getString(key);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> put(String key, String value) async {
    try {
      return preferences.setString(key, value);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}