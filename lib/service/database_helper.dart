import 'package:sqflite/sqflite.dart';

class databaseHelper {
  static const _databaseName = 'app.db';
  static const _databaseVersion = 1;

  databaseHelper._internal();
  static final databaseHelper databasehelper = databaseHelper._internal();
  static databaseHelper get instance => databasehelper;

  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();

    String path = join(dbPath, _database);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('Create  Table User('
        'Id inventer primary'
        'userName Text'
        'email Text'
        'Password Text'
        ')');
  }
}

join(String dbPath, Database? database) {}
