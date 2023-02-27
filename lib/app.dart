import 'package:flutter/material.dart';

import 'screens/welcome_screen.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  static final routes = {
    Welcome.routeName: (context) => const Welcome(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Journal',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      routes: routes,
    );
  }
}
