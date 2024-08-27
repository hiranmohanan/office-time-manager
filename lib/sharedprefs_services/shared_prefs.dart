import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  late SharedPreferences _prefs;

  Future<void> initprefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> setString(String key, String value) async {
    await Future.wait([
      initprefs(),
      _prefs.setString(key, value),
    ]);
  }

  Future<String?> getString(String key) async {
    await initprefs();
    return _prefs.getString(key);
  }
}
