import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._constructor();
  static Database? _database;
  DatabaseService._constructor();
  Future<Database> get db async {
    if (_database != null) return _database!;
    _database = await getDatabase();
    return _database!;
  }

  Future<Database> getDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'daily_attendence.db');
    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE daily_attendence(
        id INTEGER PRIMARY KEY,
        date TEXT NOT NULL,
        time TEXT NOT NULL,
        punch_in TEXT NOT NULL,
        punch_out TEXT NOT NULL
      )
    ''');
  }

  void addPunch(
      {required String date,
      required String time,
      required String punchIn,
      required String punchOut}) async {
    final data = await db;
    data.rawInsert('''
      INSERT INTO daily_attendence(date, time, punch_in, punch_out)
      VALUES('$date', '$time', '$punchIn', '$punchOut')
    ''');
  }

  Future<List<Map<String, dynamic>>> getPunch() async {
    final data = await db;
    final responce = data.query('daily_attendence');
    debugPrint(
        'getPunch  ================== ${responce.asStream().single.toString()}');

    return data.query('daily_attendence');
  }
// var databasesPath = await getDatabasesPath();
// String path = join(databasesPath, 'daily_attendence.db');
}
