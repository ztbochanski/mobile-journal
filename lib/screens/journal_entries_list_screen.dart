import 'package:flutter/material.dart';

import 'package:journal/db/database_manager.dart';
import 'package:journal/models/journal_entry.dart';
import 'package:journal/models/journal.dart';
import 'package:journal/screens/new_entry_screen.dart';
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
    return ListView.builder(
      itemCount: journal.numberOfEntries,
      itemBuilder: (context, index) {
        const snippetLength = 60;
        final entry = journal.entries[index];
        final lineBreakIndex = entry.body.indexOf('\n');
        String snippet;
        if (lineBreakIndex > 0) {
          snippet = '${entry.body.substring(0, lineBreakIndex)}...';
        } else if (entry.body.length > snippetLength) {
          snippet = '${entry.body.substring(0, snippetLength)}...';
        } else {
          snippet = entry.body;
        }
        final subtitle = entry.rating > 1
            ? '$snippet \n${entry.rating} stars'
            : '$snippet \n${entry.rating} star';
        return ListTile(
          title: Text(entry.title),
          subtitle: Text(subtitle),
        );
      },
    );
  }

  FloatingActionButton addJournalEntryFab(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        displayJournalEntryScreen(context);
      },
      child: const Icon(Icons.add),
    );
  }

  void displayJournalEntryScreen(BuildContext context) async {
    await Navigator.pushNamed(context, NewEntryScreen.routeName);
    _loadJournal();
  }
}
