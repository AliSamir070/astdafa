import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper{
  static SharedPreferences? prefs;
  static Future<bool> setData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await prefs!.setString(key, value);
    } else if (value is int) {
      return await prefs!.setInt(key, value);
    } else if (value is bool) {
      return await prefs!.setBool(key, value);
    } else if (value is double) {
      return await prefs!.setDouble(key, value);
    } else if (value is List<String>) {
      return await prefs!.setStringList(key, value);
    } else {
      return false;
    }
  }
  static String getCode(){
    return prefs?.getString("code")??"";
  }
  static String getPhone(){
    return prefs?.getString("phone")??"";
  }
  static void clearCode(){
    prefs?.remove("code");
  }static void clearPhone(){
    prefs?.remove("phone");
  }

}