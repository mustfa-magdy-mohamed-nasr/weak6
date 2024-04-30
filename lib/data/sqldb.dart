import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get db async {
    _db ??= await initialDb();
    return _db;
  }

  Future<Database> initialDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "el_fasafees.db");

    Database mydb = await openDatabase(path, onCreate: _onCreate, version: 1,
    onUpgrade: _onUpgrade
    );

    // Move the print statement before the return statement
    print("initialDb=======================================");
    
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) async {
    await db.execute(
        "ALTER TABEL elfasafees ADD COLUMN title fanction phone email image");
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE elfasafees (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "title" TEXT NOT NULL,
  "fanction" TEXT NOT NULL,
  "phone" TEXT NOT NULL,
  "email" TEXT NOT NULL,
  "image" TEXT NOT NULL
)
    ''');
    print("_onCreate=======================================");
  }

  Future<List<Map<String, dynamic>>> readDbase(String sql) async {
    Database? mydb = await db;
    List<Map<String, dynamic>> response = await mydb!.rawQuery(sql);
    return response;
  }

  Future<int> insertDbase(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  Future<int> updateDbase(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  Future<int> deleteDbase(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }
}
