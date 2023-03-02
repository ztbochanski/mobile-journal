import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:journal/app.dart';
import 'package:journal/db/database_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  await DatabaseManager.initialize();
  runApp(const App());
}
