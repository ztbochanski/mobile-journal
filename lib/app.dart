import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Journal',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
    );
  }
}
