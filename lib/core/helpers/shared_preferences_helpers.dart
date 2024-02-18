import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

Future<void> setMap(
    String key, Map<String, dynamic> value, SharedPreferences prefs) async {
  final String encodedData = jsonEncode(value);
  await prefs.setString(key, encodedData);
}

Map<String, dynamic> getMap(String key, SharedPreferences prefs) {
  final String? encodedData = prefs.getString(key);
  return encodedData != null ? jsonDecode(encodedData) : null;
}

void saveIntSettingToSharedPreferences(
    SharedPreferences prefs, String key, dynamic value) async {
  await prefs.setInt(key, value);
}

void saveStringSettingToSharedPreferences(
    SharedPreferences prefs, String key, dynamic value) async {
  await prefs.setString(key, value);
}

void saveBoolSettingToSharedPreferences(
    SharedPreferences prefs, String key, dynamic value) async {
  await prefs.setBool(key, value);
}
