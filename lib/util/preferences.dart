import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  static Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  static Future<String> getString(String key) async {
    final p = await prefs;
    return p.getString(key) ?? '';
  }

  static Future setString(String key, String value) async {
    final p = await prefs;
    return p.setString(key, value);
  }

  static Future<int> getInt(String key) async {
    final p = await prefs;
    return p.getInt(key) ?? 0;
  }

  static Future setInt(String key, int value) async {
    final p = await prefs;
    return p.setInt(key, value);
  }

  static Future<bool> getBool(String key) async {
    final p = await prefs;
    return p.getBool(key) ?? false;
  }

  static Future setBool(String key, bool value) async {
    final p = await prefs;
    return p.setBool(key, value);
  }
}

class Prefs {
  static Future<String> get getToken =>
      PreferencesHelper.getString(Const.token);

  static Future setToken(String value) =>
      PreferencesHelper.setString(Const.token, value);

  static Future removeToken(String value) =>
      PreferencesHelper.setString(Const.token, value);
}

class Const {
  static const String token = 'token';
}
