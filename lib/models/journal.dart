import 'package:journal/models/journal_entry.dart';

class Journal {
  final List<JournalEntry> entries;

  Journal({required this.entries});

  int get numberOfEntries => entries.length;

  bool get isEmpty => entries.isEmpty;
}
