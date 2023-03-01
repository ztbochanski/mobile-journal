import 'package:flutter/material.dart';

import 'package:journal/screens/welcome_screen.dart';
import 'package:journal/screens/journal_entries_list_screen.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Journal',
      initialRoute: '/',
      routes: {
        '/': (context) => const JournalEntriesListScreen(),
        '/welcome': (context) => const WelcomeScreen(),
      },
    );
  }
}
