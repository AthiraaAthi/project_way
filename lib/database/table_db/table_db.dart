import 'package:project_way/model/table_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TableDb {
  static final TableDb _instance = TableDb._internal();
  factory TableDb() => _instance;

  static Database? _database;

  TableDb._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'budget.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE budget(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        amount TEXT,
        month TEXT,
        category TEXT
      )
    ''');
  }

  Future<int> insertBudget(TableModel budget) async {
    Database db = await database;
    return await db.insert('budget', budget.toMap());
  }

  Future<List<TableModel>> fetchBudgets() async {
    Database db = await database;
    List<Map<String, dynamic>> result = await db.query('budget');
    return result.map((budget) => TableModel.fromMap(budget)).toList();
  }
}
