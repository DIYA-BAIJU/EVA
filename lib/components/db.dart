import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../helpers/db_helper.dart';

class DbModule {
  late final Database db;
  initDB() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "eva.db");

// Check if the database exists
    var exists = await databaseExists(path);
    // var exists = false;
    if (!exists) {
// Should happen only the first time you launch your application
      print("Creating new copy from asset");

// Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

// Copy from asset
      ByteData data = await rootBundle.load(join("assets", "eva.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

// Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }

// open the database
    db = await openDatabase(path, readOnly: true);
  }

  testDB() async {
    var res = await db.rawQuery("select * from canteen;");
    print(res);
  }

  getAnswerFromDB(List<String> intents) async {
    var queryString = "";
    if (tables.contains(intents[0]) && queries.contains(intents[1])) {
      queryString =
          "select answer from ${intents[0]} where query='${intents[1]}';";
    } else if (tables.contains(intents[1]) && queries.contains(intents[0])) {
      queryString =
          "select answer from ${intents[1]} where query='${intents[0]}';";
    }

    if (queryString != "") {
      print(queryString);
      var res = await db.rawQuery(queryString);
      print(res);
      var queryRes = res.first;
      print("DB RES: ${queryRes["answer"] ?? 'SORRY I CANNOT ANSWER YOU'}");
    }
  }
}
