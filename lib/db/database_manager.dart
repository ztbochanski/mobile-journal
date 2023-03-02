import 'package:sqflite/sqflite.dart';

import 'package:journal/models/journal_entry.dart';
import 'package:journal/models/journal_entry_dto.dart';

class DatabaseManager {
  static const _databaseName = 'journal.sqlite3.db';
  static const _databaseVersion = 1;

  static const table = 'journal_entries';

  static const id = '_id';
  static const title = 'title';
  static const body = 'body';
  static const rating = 'rating';
  static const date = 'date';

  static const entrySchema = 'CREATE TABLE IF NOT EXISTS $table('
      '$id INTEGER PRIMARY KEY AUTOINCREMENT,'
      '$title TEXT,'
      '$body TEXT,'
      '$rating INTEGER,'
      '$date DATETIME)';

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
    await db.execute(entrySchema);
  }

  // Future<void> insertJournalEntry(JournalEntryDTO entry) async {
  //   _database.transaction((txn) async {
  //     await txn.rawInsert(entryInsert, [
  //       entry.rating,
  //       entry.title,
  //       entry.body,
  //       entry.date.toString(),
  //     ]);
  //   });
  // }

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
        id: record['_id'],
        rating: record['rating'],
        title: record['title'],
        body: record['body'],
        date: DateTime.parse(record['date']),
      );
    }).toList();

    return journalEntries;
  }
}
