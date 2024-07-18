import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TableDb {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'your_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE entries(id INTEGER PRIMARY KEY AUTOINCREMENT, amount TEXT, month TEXT, category TEXT)",
        );
      },
      version: 1,
    );
  }

  Future<void> insertEntry(Map<String, dynamic> entry) async {
    final db = await database;
    await db.insert(
      'entries',
      entry,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateEntry(Map<String, String> entry) async {
    final db = await database;
    await db.update(
      'entries',
      entry,
      where: 'id = ?',
      whereArgs: [entry['id']],
    );
  }

  Future<void> deleteEntry(int id) async {
    try {
      final db = await database;
      await db.delete(
        'entries',
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      print('Error deleting entry: $e');
      throw Exception('Failed to delete entry');
    }
  }

  Future<List<Map<String, dynamic>>> getAllEntries() async {
    final db = await database;
    return db.query('entries');
  }
}
