import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Snack {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDB();
      return _db;
    } else {
      return _db;
    }
  }

  // CREATE/OPEN THE DATABASE
  initDB() async {
    // SPECIFY THE PATH TO STORE THE DATABASE FILE IN YOUR DEVICE
    String databasepath = await getDatabasesPath();
    //GIVE THE DATABASE FILE A NAME SO FOR EXAMPLE THIS WILL BE IN data/data/databasepath/colicart.db
    String path = join(databasepath, 'colicart.db');
    //OPEN DATABASE
    Database mydb = await openDatabase(
      path,
      version: 1,
      //CREATE THE DATABASE WITH A TABLE
      onCreate:
          _onCreateDB, //CHECK FOR 'DB BEING CREATED IN THIS PRIVATE CONSTRUCTOR' BENEATH TO SEE FULL CODE CONTROLLING THIS
      onUpgrade:
          _onUpgradeDB, // CHECK FOR 'THE PRIVATE CONSTRUCTOR IN CHARGE OF DB UPGRADE' BENEATH TO SEE FULL CODE CONTROLLING THISbb
    );
    return mydb;
  }

  // DB BEING CREATED IN THIS PRIVATE CONSTRUCTOR
  _onCreateDB(Database db, int version) async {
    await db.execute('''
        CREATE TABLE cart(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          image_url TEXT NOT NULL,
          quantity INTEGER NOT NULL,
          total INTEGER NOT NULL
        )
        ''');
    debugPrint('===== CREATED DATABASE THEN TABLE =====');
  }

  // THE PRIVATE CONSTRUCTOR IN CHARGE OF DB UPGRADE
  _onUpgradeDB(Database db, int oldeversion, int neewversion) {
    debugPrint(' ===== Database Upgrade Successful');
  }

  // READ THE DATA FROM THE DATABASE
  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  // INSERT DATA TO THE DATABASE
  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  // UPDATE DATA TO THE DATABASE
  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  // DELETE DATA TO THE DATABASE
  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }
}
