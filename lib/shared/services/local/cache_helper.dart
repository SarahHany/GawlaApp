import 'package:shared_preferences/shared_preferences.dart';

class CachedHelper {
  static SharedPreferences? _sharedPreferences;

  static Future init() async {
    return _sharedPreferences = await SharedPreferences.getInstance();
  }

  static String? getString({required String key}) {
    return _sharedPreferences!.getString(key);
  }

  static bool? getBooleon({required String key}) {
    return _sharedPreferences!.getBool(key);
  }

  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is String) {
      return await _sharedPreferences!.setString(key, value);
    } else if (value is int) {
      return await _sharedPreferences!.setInt(key, value);
    } else if (value is bool) {
      return await _sharedPreferences!.setBool(key, value);
    } else {
      return _sharedPreferences!.setDouble(key, value);
    }
  }


  static Future<bool> clearData()async{
    return await _sharedPreferences!.clear();
  }
}
