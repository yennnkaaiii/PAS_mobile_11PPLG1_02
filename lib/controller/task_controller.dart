import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_02/model/favorite_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TaskController extends GetxController {
  static Database? _db;
  var tasks = <FavoriteModel>[].obs;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDB();
    }
    return _db;
  }

  Future<Database> initDB() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'task_database.db');

    return await openDatabase(
      path,
      version: 2,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE tasks(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            strTeam TEXT UNIQUE,
            strBadge TEXT,
            strStadium TEXT,
            strDescriptionEN TEXT,
            isCompleted INTEGER
          )
        ''');
      },
    );
  }

  Future<int> addTask(FavoriteModel task) async {
    var dbClient = await db;
    int result = await dbClient!.insert(
      'tasks',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await loadTasks();
    return result;
  }

  Future<void> loadTasks() async {
    var dbClient = await db;
    List<Map<String, dynamic>> queryResult = await dbClient!.query('tasks');
    tasks.assignAll(
      queryResult.map((data) => FavoriteModel.fromMap(data)).toList(),
    );
  }

  Future<void> deleteTaskByName(String name) async {
    var dbClient = await db;
    await dbClient!
        .delete('tasks', where: 'strTitle = ?', whereArgs: [name]);
    await loadTasks();
  }

  bool isFavorite(String name) {
    return tasks.any((task) => task.strTitle == name);
  }
}
