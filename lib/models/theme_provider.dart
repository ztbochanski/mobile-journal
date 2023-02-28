import 'package:flutter/foundation.dart';
import 'package:journal/utils/theme_preference.dart';

/// This model defines a `ChangeNotifier` class to hold the current state of the theme.
/// `_isDarkMode` bool the current state of the theme.
class ThemeProvider with ChangeNotifier {
  final ThemePreference _themePreference = ThemePreference();
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  set isDarkMode(bool value) {
    _isDarkMode = value;
    _themePreference.setTheme(value);
    notifyListeners();
  }
}
