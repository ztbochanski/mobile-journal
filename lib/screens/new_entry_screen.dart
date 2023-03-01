import 'package:flutter/material.dart';

import 'package:journal/widgets/journal_entry_form.dart';
import 'package:journal/widgets/journal_scaffold.dart';

class NewEntryScreen extends StatelessWidget {
  const NewEntryScreen({Key? key}) : super(key: key);

  static const routeName = '/new_entry_screen';

  @override
  Widget build(BuildContext context) {
    return const JournalScaffold(
      title: 'New Journal Entry',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: JournalEntryForm(),
      ),
    );
  }
}
