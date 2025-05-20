import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtil {
  static late final SharedPreferences preferences;
  static bool _init = false;

  static Future<dynamic> init() async {
    if (_init) return;
    preferences = await SharedPreferences.getInstance();
    _init = true;
    return preferences;
  }

  static void setValue(String key, Object value) {
    switch (value.runtimeType) {
      case const (String):
        preferences.setString(key, value as String);
      case const (bool):
        preferences.setBool(key, value as bool);
      case const (int):
        preferences.setInt(key, value as int);
      default:
    }
  }

  static Object getValue(String key, Object defaultValue) {
    switch (defaultValue.runtimeType) {
      case const (String):
        return preferences.getString(key) ?? '';
      case const (bool):
        return preferences.getBool(key) ?? false;
      case const (int):
        return preferences.getInt(key) ?? 0;
      default:
        return defaultValue;
    }
  }

  static Object removeValue(String key) {
    return preferences.remove(key);
  }
}
