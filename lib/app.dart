import 'package:flutter/material.dart';

import 'screens/welcome_screen.dart';

const String appTitle = 'Journal';
const String welcomeMessage = 'Welcome! To start writing, tap the + button';

class App extends StatefulWidget {
  final bool theme;

  const App({Key? key, required this.theme}) : super(key: key);

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  static final routes = {
    Welcome.routeName: (context) =>
        const Welcome(title: appTitle, welcomeMessage: welcomeMessage),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: widget.theme ? ThemeMode.dark : ThemeMode.light,
      routes: routes,
    );
  }
}
