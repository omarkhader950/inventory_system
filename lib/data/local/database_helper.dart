import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  // Singleton pattern
  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'inventory.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // Create the MergedItems table
    await db.execute('''
    CREATE TABLE MergedItems (
      companyNo TEXT,
      itemNo TEXT PRIMARY KEY,
      name TEXT,
      categoryId TEXT,
      itemK TEXT,
      barcode TEXT,
      minPrice TEXT,
      itemL TEXT,
      isSuspended TEXT,
      fD TEXT,
      itemHasSerial TEXT,
      itemPicsPath TEXT,
      taxPerc TEXT,
      isApiPic TEXT,
      lsPrice TEXT,
      stockCode TEXT,
      qty TEXT
    )
  ''');
  }

}
