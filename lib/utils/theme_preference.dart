import 'package:shared_preferences/shared_preferences.dart';

/// This class defines a `SharedPreferences` class to store the theme state in device preferences.
class ThemePreference {
  static const themeToggleKey = 'themeToggleKey';

  void setTheme(bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(themeToggleKey, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(themeToggleKey) ?? false;
  }
}
