import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class DataBaseService {
  static Future<Map<String, dynamic>> read(String key) async {
    if (!await check(key)) return {};
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key)!)[key];
  }

  static Future<bool> check(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final bool check = prefs.containsKey(key);
    return check;
  }

  static Future<void> save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode({key: value}));
  }

  static Future<void> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
