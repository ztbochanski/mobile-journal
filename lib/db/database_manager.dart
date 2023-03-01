import 'package:flutter/services.dart';

import 'package:sqflite/sqflite.dart';

import 'package:journal/models/journal_entry.dart';
import 'package:journal/db/entry_data_transfer_object.dart';

/// This manages the database and allows provider to listen to changes in the db.
/// This is a singleton class (instantiated only once).
// class DatabaseManager extends ChangeNotifier {
//   // static const sqlInsert =
//   //     'INSERT INTO journal_entries(title, body, rating, date) VALUES (?, ?, ?, ?)';
//   // static const sqlSelect = 'SELECT * FROM journal_entries';
//   // static const sqlSchema = 'CREATE TABLE journal_entries('
//   //     'id INTEGER PRIMARY KEY AUTOINCREMENT,'
//   //     'title TEXT,'
//   //     'body TEXT,'
//   //     'rating INTEGER,'
//   //     'date DATETIME)';

//   static const _databaseName = 'journal.sqlite3.db';
//   static const table = 'journal_entries';

//   static const id = '_id';
//   static const title = 'title';
//   static const body = 'body';
//   static const rating = 'rating';
//   static const date = 'date';

//   static const entrySchema = 'CREATE TABLE $table('
//       '$id INTEGER PRIMARY KEY AUTOINCREMENT,'
//       '$title TEXT,'
//       '$body TEXT,'
//       '$rating INTEGER,'
//       '$date DATETIME)';

//   static const entryInsert =
//       'INSERT INTO $table($title, $body, $rating, $date) '
//       'VALUES (?, ?, ?, ?)';

//   static const entrySelect = 'SELECT * FROM $table';

//   static DatabaseManager _instance = DatabaseManager._();

//   late final Database _db;

//   DatabaseManager._({Database? database}) : _db = database!;

//   DatabaseManager({Database? database}) : _db = database!;

//   factory DatabaseManager.getInstance() {
//     return _instance;
//   }

//   static Future initialize() async {
//     final dbPath = await getDatabasesPath();
//     final path = '$dbPath/$_databaseName';
//     final sql = await rootBundle.loadString(entrySchema);

//     final db = await openDatabase(path, version: 1,
//         onCreate: (Database db, int version) async {
//       db.execute(sql);
//     });
//     _instance = DatabaseManager._(database: db);
//   }

//   Future<void> insert(EntryDTO entry) async {
//     await _db.transaction((txn) async {
//       await txn.rawInsert(entryInsert, [
//         entry.title,
//         entry.body,
//         entry.rating,
//         entry.date.toIso8601String(),
//       ]);
//     });

//     notifyListeners();
//   }

//   Future<List<JournalEntry>> journalEntries() async {
//     final List<Map> journalRecords = await _db.rawQuery(entrySelect);

//     final journalEntries = journalRecords.map((record) {
//       return JournalEntry(
//         id: record['id'],
//         title: record['title'],
//         body: record['body'],
//         rating: record['rating'],
//         date: DateTime.parse(record['date']),
//       );
//     }).toList();

//     return journalEntries;
//   }

//   static DatabaseManager of(BuildContext context) =>
//       Provider.of<DatabaseManager>(context, listen: false);
// }

class DatabaseManager {
  static const _databaseName = 'journal.sqlite3.db';
  static const _databaseVersion = 1;

  static const table = 'journal_entries';

  static const id = '_id';
  static const title = 'title';
  static const body = 'body';
  static const rating = 'rating';
  static const date = 'date';

  static const entrySchema = 'CREATE TABLE $table('
      '$id INTEGER PRIMARY KEY AUTOINCREMENT,'
      '$title TEXT,'
      '$body TEXT,'
      '$rating INTEGER,'
      '$date DATETIME)';

  static const entryInsert =
      'INSERT INTO $table($title, $body, $rating, $date) '
      'VALUES (?, ?, ?, ?)';

  static const entrySelect = 'SELECT * FROM $table';

  static late Database _database;

  static Future<Database> get database async {
    _database = await _initDatabase();
    return _database;
  }

  static Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = '$databasePath/$_databaseName';
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreateDatabase,
    );
  }

  static Future<void> _onCreateDatabase(Database db, int version) async {
    final sql = await rootBundle.loadString(entrySchema);
    await db.execute(sql);
  }

  static Future<void> insertJournalEntry(EntryDTO entry) async {
    await _database.transaction((txn) async {
      await txn.rawInsert(entryInsert, [
        entry.rating,
        entry.title,
        entry.body,
        entry.date.toIso8601String(),
      ]);
    });
  }

  static Future<void> deleteJournalEntry(int id) async {
    final db = await database;
    await db.delete(
      'journal_entries',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<List<JournalEntry>> getAllJournalEntries() async {
    final db = await database;
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
}
