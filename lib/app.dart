import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:journal/screens/journal_entry_screen.dart';
import 'package:journal/screens/new_entry_screen.dart';
import 'package:journal/screens/journal_entries_list_screen.dart';

class App extends StatefulWidget {
  bool isDarkMode;
  late SharedPreferences prefs;

  App({
    Key? key,
    required this.isDarkMode,
    required this.prefs,
  }) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  void _onToggleTheme() async {
    setState(() {
      widget.isDarkMode = widget.isDarkMode ? false : true;
    });
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', widget.isDarkMode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'App',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        darkTheme: ThemeData(brightness: Brightness.dark),
        themeMode: widget.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        routes: {
          JournalEntriesListScreen.routeName: (context) =>
              JournalEntriesListScreen(
                  isDarkMode: widget.isDarkMode, onToggleTheme: _onToggleTheme),
          NewEntryScreen.routeName: (context) => NewEntryScreen(
              isDarkMode: widget.isDarkMode, onToggleTheme: _onToggleTheme),
          JournalEntryScreen.routeName: (context) => JournalEntryScreen(
              isDarkMode: widget.isDarkMode, onToggleTheme: _onToggleTheme)
        });
  }
}
