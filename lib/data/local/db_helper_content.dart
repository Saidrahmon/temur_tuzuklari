import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

// only have a single app-wide reference to the database
  static Database db;

  Future<Database> get database async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "my_database.db");

    print(databasesPath);
    print(path);

    // Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // This will get initiate only on the first time you launch your application
      print("Creating new copy from asset >>>");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", "my_database.db"));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      //DB ALready exists return the db
      print("Opening existing database >>>");
    }

    // open the database
    db = await openDatabase(path, readOnly: true);
    return db;
  }

  Future<List<String>> getAllPersons() async {
    final db = await database;
    //Using a RAW Query here to fetch the list of data
    var response = await db.rawQuery("SELECT title FROM content WHERE lang = 'oz' AND categoryId = 1");
    //print(response);
    List<String> list = response.map((c) => c.values.toString().substring(1, c.values.toString().length - 1)).toList();
    return list;
  }

  Future<String> getStoryByTitle(String title) async{
    final db = await database;
    //Using a RAW Query here to fetch the list of data
    var response = await db.rawQuery("SELECT text FROM content WHERE title = '${title}'");
    String text = response[0].values.toString().substring(1, response[0].values.toString().length - 1).toString();
    // String text =  response.map((e) => e.values.toString().substring(2)).toString();
    return text;
    // print(text);
    // List<String> list = response.map((c) => c.values.toString().substring(1, c.values.toString().length - 1)).toList();
    // return list;
  }

}