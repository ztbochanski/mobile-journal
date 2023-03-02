import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:journal/db/database_manager.dart';
import 'package:journal/models/journal_entry.dart';
import 'package:journal/models/journal.dart';
import 'package:journal/screens/new_entry_screen.dart';
import 'package:journal/screens/journal_entry_screen.dart';
import 'package:journal/widgets/journal_scaffold.dart';
import 'package:journal/widgets/welcome.dart';

class JournalEntriesListScreen extends StatefulWidget {
  const JournalEntriesListScreen({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  State<JournalEntriesListScreen> createState() =>
      _JournalEntriesListScreenState();
}

class _JournalEntriesListScreenState extends State<JournalEntriesListScreen> {
  Journal journal = Journal(entries: []);
  static const padding = EdgeInsets.all(8.0);
  @override
  void initState() {
    super.initState();
    _loadJournal();
  }

  void _loadJournal() async {
    final databaseManager = DatabaseManager.getInstance();
    List<JournalEntry> entries = await databaseManager.getAllJournalEntries();
    setState(() {
      journal = Journal(entries: entries);
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    if (journal == null) {
      return JournalScaffold(
        title: 'Loading...',
        floatingActionButton: addJournalEntryFab(context),
        child: const Center(child: CircularProgressIndicator()),
      );
    } else {
      return JournalScaffold(
        title: journal.isEmpty ? 'Welcome!' : 'Journal Entries',
        floatingActionButton: addJournalEntryFab(context),
        child: journal.isEmpty ? const Welcome() : journalEntryList(context),
      );
    }
  }

  Widget journalEntryList(BuildContext context) {
    return Padding(
        padding: padding,
        child: ListView.builder(
          itemCount: journal.numberOfEntries,
          itemBuilder: (context, index) {
            final entry = journal.entries[index];

            DateFormat dateFormat = DateFormat('EEEE, MMMM d, yyyy');
            String subtitle = dateFormat.format(entry.date);

            return Padding(
                padding: padding,
                child: ListTile(
                  title: Text(entry.title),
                  subtitle: Text(subtitle),
                  onTap: () {
                    displayJournalEntryScreen(context, entry);
                  },
                ));
          },
        ));
  }

  FloatingActionButton addJournalEntryFab(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        displayNewEntryScreen(context);
      },
      child: const Icon(Icons.add),
    );
  }

  void displayNewEntryScreen(BuildContext context) async {
    await Navigator.pushNamed(context, NewEntryScreen.routeName);
    _loadJournal();
  }

  void displayJournalEntryScreen(BuildContext context, entry) async {
    await Navigator.pushNamed(context, JournalEntryScreen.routeName,
        arguments: entry);
  }
}
