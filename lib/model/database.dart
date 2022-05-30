import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Snack {
  initDB() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'colicart.db');
    Database mydb = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
        CREATE TABLE "cart"(
          id AUTOINCREMENT NOT NULL PRIMARY KEY,
          name TEXT NOT NULL,
          image_url TEXT NOT NULL,
          quantity INT NOT NULL,
          total INT NOT NULL,
        )
        ''');
      },
    );
    return mydb;
  }
}
