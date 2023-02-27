import 'package:flutter/material.dart';

import 'screens/welcome_screen.dart';

class App extends StatefulWidget {
  final bool theme;

  const App({Key? key, required this.theme}) : super(key: key);

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
        primarySwatch: Colors.pink,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: widget.theme ? ThemeMode.dark : ThemeMode.light,
      routes: routes,
    );
  }
}
