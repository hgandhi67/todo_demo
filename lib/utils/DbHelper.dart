import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sqflite/sqflite.dart';

class DbHelper {
  Database? database;

  DbHelper._();

  static DbHelper dbHelper = DbHelper._();

  Future<Database?> checkDb() async {
    if (database != null) {
      return database;
    } else {
      return await createDb();
    }
  }

  Future<Database?> createDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'demo.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query = "CREATE TABLE std (id INTEGER PRIMARY KEY AUTOINCREMENT,date TEXT,category TEXT)";
        database!.execute(query);
      },
    );
  }

  Future<void> insertData({required String date, required String cat}) async {
    database = await checkDb();
    database!.insert(
      'std',
      {"date": date, "category": cat},
    );
  }

  Future<List<Map>> readData() async {
    database = await checkDb();
    String query = "SELECT * FROM std";
    List<Map> dataList = await database!.rawQuery(query);
    return dataList;
  }

  Future<void> deleteData({required int id}) async {
    database = await checkDb();
    database!.delete(
      'std',
      where: "id=?",
      whereArgs: ['id'],
    );
  }
}
