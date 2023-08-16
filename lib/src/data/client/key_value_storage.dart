import 'package:shared_preferences/shared_preferences.dart';

class KeyValueStorage {
  static final KeyValueStorage _instance = KeyValueStorage._();
  late SharedPreferences _preferences;

  KeyValueStorage._();

  static KeyValueStorage getInstance() {
    return _instance;
  }

  //TODO
  Future<void> initSharedPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<String?> getString(String key) async {
    _preferences = await SharedPreferences.getInstance();
    return _preferences.getString(key);
  }

  Future<void> setString(String key, String value) async {
    _preferences = await SharedPreferences.getInstance();
    await _preferences.setString(key, value);
  }
}
