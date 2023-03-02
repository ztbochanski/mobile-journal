import 'package:flutter/material.dart';

import 'package:journal/db/database_manager.dart';
import 'package:journal/models/journal_entry_dto.dart';
import 'package:journal/widgets/rating_form_field.dart';

class JournalEntryForm extends StatefulWidget {
  const JournalEntryForm({Key? key}) : super(key: key);

  @override
  State<JournalEntryForm> createState() => _JournalEntryFormState();
}

class _JournalEntryFormState extends State<JournalEntryForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  final journalEntryDTO = JournalEntryDTO();

  final databaseManager = DatabaseManager.getInstance();

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(10.0), child: titleFormField()),
            Padding(
                padding: const EdgeInsets.all(10.0), child: bodyFormField()),
            Padding(
                padding: const EdgeInsets.all(10.0), child: ratingFormField()),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  databaseManager.insertJournalEntry(journalEntryDTO);
                  Navigator.pop(context);
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Widget titleFormField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Title',
        border: OutlineInputBorder(),
      ),
      onSaved: (value) {
        journalEntryDTO.title = value!;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a title';
        }
        return null;
      },
    );
  }

  Widget bodyFormField() {
    return TextFormField(
      controller: _bodyController,
      decoration: const InputDecoration(
        labelText: 'Body',
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.multiline,
      minLines: 2,
      maxLines: 8,
      onSaved: (value) {
        journalEntryDTO.body = value!;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a body';
        }
        return null;
      },
    );
  }

  Widget ratingFormField() {
    return RatingFormField(
      initialValue: 0,
      onSaved: (value) {
        journalEntryDTO.rating = value!;
      },
    );
  }
}
