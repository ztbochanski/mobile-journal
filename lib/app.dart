import 'package:flutter/material.dart';

import 'screens/welcome_screen.dart';

const String appTitle = 'Journal';
const String welcomeMessage = 'Welcome! To start writing, tap the + button';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

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
      title: 'Journal',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      routes: routes,
    );
  }
}
