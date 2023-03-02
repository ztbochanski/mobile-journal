import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart';

import 'package:journal/models/journal_entry.dart';
import 'package:journal/models/journal_entry_dto.dart';

class DatabaseManager {
  static const _databaseName = 'journal.sqlite3.db';
  static const _databaseVersion = 1;

  static const table = 'journal_entries';

  static const id = 'id';
  static const title = 'title';
  static const body = 'body';
  static const rating = 'rating';
  static const date = 'date';

  static const schemaFilePath = 'assets/database_schema.txt';

  static const entryInsert =
      'INSERT INTO $table($title, $body, $rating, $date) '
      'VALUES (?, ?, ?, ?)';

  static const entrySelect = 'SELECT * FROM $table';

  static DatabaseManager _instance = DatabaseManager._();

  late final Database _database;

  DatabaseManager._({Database? database}) : _database = database!;

  factory DatabaseManager.getInstance() {
    return _instance;
  }

  static Future initialize() async {
    await deleteDatabase('journal.sqlite3.db');
    final databasePath = await getDatabasesPath();
    final path = '$databasePath/$_databaseName';
    final db = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: onCreateDatabase,
    );
    _instance = DatabaseManager._(database: db);
  }

  static Future<void> onCreateDatabase(Database db, int version) async {
    String schema = await loadAsset(schemaFilePath);
    await db.execute(schema);
  }

  Future<void> insertJournalEntry(JournalEntryDTO entry) async {
    final db = _database;
    await db.insert(
      'journal_entries',
      entry.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteJournalEntry(int id) async {
    final db = _database;
    await db.delete(
      'journal_entries',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<JournalEntry>> getAllJournalEntries() async {
    final db = _database;
    final List<Map> journalRecords = await db.query('journal_entries');
    final journalEntries = journalRecords.map((record) {
      return JournalEntry(
        id: record['id'],
        rating: record['rating'],
        title: record['title'],
        body: record['body'],
        date: DateTime.parse(record['date']),
      );
    }).toList();

    return journalEntries;
  }

  static Future<String> loadAsset(String filePath) async {
    return await rootBundle.loadString(filePath);
  }
}
