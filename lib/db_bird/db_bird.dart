
import 'package:bird_project/db_bird/bird_entity.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBBird extends GetxService {
  late Database dbBase;

  Future<DBBird> init() async {
    await createBirdDB();
    return this;
  }

  createBirdDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'bird.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createBirdTable(db);
        });
  }

  createBirdTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS bird (id INTEGER PRIMARY KEY, createTime TEXT, count INTEGER)');
  }

  insertBird(BirdEntity entity) async {
    final id = await dbBase.insert('bird', {
      'createTime': entity.createTime.toIso8601String(),
      'count': entity.count,
    });
    return id;
  }

  cleanBirdData() async {
    await dbBase.delete('bird');
  }

  Future<List<BirdEntity>> getBirdAllData() async {
    var result = await dbBase.query('bird', orderBy: 'createTime DESC');
    return result.map((e) => BirdEntity.fromJson(e)).toList();
  }
}
