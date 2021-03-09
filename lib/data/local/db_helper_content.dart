import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database db;

  Future<Database> get database async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "my_database.db");

    print(databasesPath);
    print(path);

    var exists = await databaseExists(path);

    if (!exists) {
      print("Creating new copy from asset >>>");

      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      ByteData data = await rootBundle.load(join("assets", "my_database.db"));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database >>>");
    }
    db = await openDatabase(path, readOnly: true);
    return db;
  }

  Future<List<String>> getAllPersons() async {
    final db = await database;
    var response = await db.rawQuery("SELECT title FROM content WHERE lang = 'oz' AND categoryId = 1");
    List<String> list = response.map((c) => c.values.toString().substring(1, c.values.toString().length - 1)).toList();
    return list;
  }

  Future<String> getStoryByTitle(String title) async{
    final db = await database;
    var response = await db.rawQuery("SELECT text FROM content WHERE title = '${title}'");
    String text = response[0].values.toString().substring(1, response[0].values.toString().length - 1).toString();
    return text;
  }

}