import 'package:flutter/foundation.dart';

import 'package:journal/utils/theme_preference.dart';

/// This model defines a `ChangeNotifier` class to hold the current state of the theme.
/// `_isDarkMode` bool the current state of the theme.
class ThemeProvider with ChangeNotifier {
  final ThemePreference _themePreference = ThemePreference();
  bool _isDarkModeOn = true;

  ThemeProvider() {
    _loadTheme();
  }

  bool get isDarkModeOn => _isDarkModeOn;

  void toggleTheme(bool isOn) {
    _isDarkModeOn = isOn;
    _themePreference.saveThemeToPrefs(isOn);
    notifyListeners();
  }

  void _loadTheme() async {
    _isDarkModeOn = await _themePreference.loadThemeFromPrefs() ?? false;
    notifyListeners();
  }
}
