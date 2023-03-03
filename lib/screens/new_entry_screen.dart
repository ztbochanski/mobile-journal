import 'package:flutter/material.dart';

import 'package:journal/widgets/journal_entry_form.dart';
import 'package:journal/widgets/journal_scaffold.dart';

class NewEntryScreen extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const NewEntryScreen(
      {Key? key, required this.isDarkMode, required this.onToggleTheme})
      : super(key: key);

  static const routeName = '/new_entry';

  @override
  Widget build(BuildContext context) {
    return JournalScaffold(
      title: 'New Journal Entry',
      isDarkMode: isDarkMode,
      onToggleTheme: onToggleTheme,
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: JournalEntryForm(),
      ),
    );
  }
}
