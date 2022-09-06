// import 'dart:developer';

// import 'package:farmdiditask/app/data/local_db_service/db_model.dart';
// import 'package:sqflite/sqflite.dart';

// late Database _db;

// Future<void> initialzeDatabase() async {
//   print("heloooooooooo");
//   _db = await openDatabase("university.db", version: 1, onCreate: _createTable);
// }

// Future<void> _createTable(Database database, int version) async {
//   String query =
//       'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT , weblink TEXT)';
//   await _db.execute(query).then((value) {
//     print("fhjkkj");
//   });
//   print("created db");
// }

// Future<void> addData(FavoutieModel value) async {
//   String query = "INSERT INTO test (name,weblink) VALUES (?,?) ";
//   await _db.rawInsert(query, [value.name, value.weblink]);
// }

// Future<void> getalldata() async {
//   final value = await _db.rawQuery('SELECT * FROM test');
//   log(value.toString());
// }
import 'dart:developer';

import 'package:farmdiditask/app/data/local_db_service/db_model.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NotesDatabase extends GetxController {
  static final NotesDatabase instance = NotesDatabase._init();
  List<FavoutieModel> favouritedata = [];
  // List<FavoutieModel> favouritedta = [];

  static Database? _database;

  NotesDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('apidata.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    String query =
        "CREATE TABLE apidata (id INTEGER PRIMARY KEY, name TEXT , weblink TEXT)";
    await db.execute(query);
  }

  Future<void> getalldata() async {
    final db = await instance.database;
    final value = await db.rawQuery('SELECT * FROM apidata');
    log(value.toString());

    favouritedata =
        value.map((json) => FavoutieModel.fromJson(json)).toSet().toList();

    update();
  }
}
