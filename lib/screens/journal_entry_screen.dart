import 'package:flutter/material.dart';

import 'package:journal/widgets/journal_scaffold.dart';
import 'package:journal/models/journal_entry.dart';

class JournalEntryScreen extends StatelessWidget {
  const JournalEntryScreen({Key? key}) : super(key: key);

  static const routeName = '/journal_entry';

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as JournalEntry;

    return JournalScaffold(
        title: arguments.title,
        child: Container(
          margin: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  arguments.body,
                  style: const TextStyle(
                    height: 2,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
