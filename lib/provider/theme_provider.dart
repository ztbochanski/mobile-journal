import 'package:flutter/foundation.dart';

import 'package:journal/utils/theme_preference.dart';

/// This model defines a `ChangeNotifier` class to hold the current state of the theme.
/// `_isDarkMode` bool the current state of the theme.
class ThemeProvider with ChangeNotifier {
  final ThemePreference _themePreference = ThemePreference();
  bool _isDarkModeOn = true;

  ThemeProvider() {
    _themePreference.loadThemeFromPrefs().then((value) {
      _isDarkModeOn = value;
      notifyListeners();
    });
  }

  bool get isDarkModeOn => _isDarkModeOn;

  void toggleTheme(bool isOn) {
    _isDarkModeOn = isOn;
    _themePreference.saveThemeToPrefs(isOn);
    notifyListeners();
  }
}
