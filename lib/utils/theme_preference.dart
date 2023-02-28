import 'package:shared_preferences/shared_preferences.dart';

/// This class defines a `SharedPreferences` class to store the theme state in device preferences.
class ThemePreference {
  late SharedPreferences _preferences;
  static const isDarkModeOn = 'isDarkModeOn';

  _initPrefs() async {
    _preferences = await SharedPreferences.getInstance();
    return _preferences;
  }

  void saveThemeToPrefs(bool isOn) async {
    _preferences = await _initPrefs();
    _preferences.setBool(isDarkModeOn, isOn);
  }

  Future<bool?> loadThemeFromPrefs() async {
    _preferences = await _initPrefs();
    return _preferences.getBool(isDarkModeOn) ?? false;
  }
}
