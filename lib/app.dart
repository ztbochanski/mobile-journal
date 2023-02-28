import 'package:flutter/material.dart';

import 'screens/welcome_screen.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late bool _isDarkMode;

  @override
  void initState() {
    super.initState();
    _isDarkMode = false;
  }

  void _toggleDarkMode(bool value) {
    setState(() {
      _isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: WelcomeScreen(
        isDarkMode: _isDarkMode,
        onDarkModeToggle: _toggleDarkMode,
      ),
    );
  }
}
