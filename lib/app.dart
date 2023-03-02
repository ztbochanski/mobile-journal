import 'package:flutter/material.dart';
import 'package:journal/screens/journal_entry_screen.dart';
import 'package:journal/screens/new_entry_screen.dart';

import 'package:journal/screens/journal_entries_list_screen.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  static final routes = {
    JournalEntriesListScreen.routeName: (context) =>
        const JournalEntriesListScreen(),
    NewEntryScreen.routeName: (context) => const NewEntryScreen(),
    JournalEntryScreen.routeName: (context) => const JournalEntryScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'App', routes: routes);
  }
}
