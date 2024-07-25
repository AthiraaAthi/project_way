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
      join(path, 'demo.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE budgetGoal(id INTEGER PRIMARY KEY AUTOINCREMENT, year TEXT, budgetType TEXT, month TEXT, StartDate TEXT, endDate TEXT, categoryId TEXT, amount TEXT, category TEXT)",
        );
      },
      version: 1,
    );
  }

  Future<void> insertEntry(Map<String, dynamic> entry) async {
    final db = await database;
    await db.insert(
      'budgetGoal',
      entry,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateEntry(int id, Map<String, dynamic> updatedEntry) async {
    final db = await database;
    await db.update(
      'budgetGoal',
      updatedEntry,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteEntry(String id) async {
    final db = await database;
    await db.delete(
      'budgetGoal',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Map<String, dynamic>>> getAllEntries() async {
    final db = await database;
    return db.query('budgetGoal');
  }
}
