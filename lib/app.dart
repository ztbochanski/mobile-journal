import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/theme_provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Journal App',
          theme:
              themeProvider.isDarkModeOn ? ThemeData.dark() : ThemeData.light(),
          home: JournalEntriesListScreen(),
        );
      },
    );
  }
  // @override
  // State<App> createState() => _AppState();
}

class JournalEntriesListScreen extends StatelessWidget {
  JournalEntriesListScreen({Key? key}) : super(key: key);
  final List<String> _entries = <String>[
    'Entry 1',
    'Entry 2',
    'Entry 3',
    'Entry 4',
    'Entry 5',
    'Entry 6',
    'Entry 7',
    'Entry 8',
    'Entry 9',
    'Entry 10',
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal Entries'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: const Text('App Settings'),
            ),
            SwitchListTile(
              title: const Text('Dark mode'),
              value: themeProvider.isDarkModeOn,
              onChanged: (value) {
                themeProvider.toggleTheme(value);
              },
            ),
          ],
        ),
      ),
      body: _entries.isEmpty
          ? const Center(
              child: Text('No entries yet'),
            )
          : ListView.builder(
              itemCount: _entries.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_entries[index]),
                );
              },
            ),
    );
  }
}

// class _AppState extends State<App> {
//   late bool _isDarkMode;

//   @override
//   void initState() {
//     super.initState();
//     _isDarkMode = false;
//   }

//   void _toggleDarkMode(bool value) {
//     setState(() {
//       _isDarkMode = value;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
//       home: WelcomeScreen(
//         isDarkMode: _isDarkMode,
//         onDarkModeToggle: _toggleDarkMode,
//       ),
//     );
//   }
// }
