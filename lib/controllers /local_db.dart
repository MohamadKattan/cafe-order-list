import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

import '../utils/constants.dart';

class LocalDataBase {
  // this method for open dataBase if not exist yet
  Future<Database> _initDatabase() async {
    String path = p.join(await getDatabasesPath(), kkorderDbName);
    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await _creatDb(db, kkorderTabelName);
    });
  }

  // this method for created table of dataBase
  Future _creatDb(Database db, String tabelName) async {
    await db.execute('''
create table $tabelName (
  $id integer primary key autoincrement,
  $kNewOrder text not null
  )
''');
  }

  // this method for insert new data to dataBase
  Future<int> setDataToLocalDB({required Map<String, dynamic> map}) async {
    final db = await _initDatabase();
    return await db.insert(kkorderTabelName, map,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future readDataFromLocalDB() async {
    final db = await _initDatabase();
    List<Map<String, dynamic>> data = await db.query(kkorderTabelName);
    return data;
  }

  // this method for delete one item from database
  Future<int> deleteOneItem({required int idItem}) async {
    final db = await _initDatabase();
    return await db
        .delete(kkorderTabelName, where: '$id = ?', whereArgs: [idItem]);
  }

  // this method for delete data base from device
  Future deleteAll() async {
    final dbPath = await getDatabasesPath();
    String path = p.join(dbPath, kkorderDbName);
    await deleteDatabase(path);
  }
}
