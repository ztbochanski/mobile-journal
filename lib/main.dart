import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:journal/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // initializeDatabase();

  setOrientations();

  runApp(const App());
}

// void initializeDatabase() async {
//   await DatabaseManager.initialize();
// }

void setOrientations() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}
