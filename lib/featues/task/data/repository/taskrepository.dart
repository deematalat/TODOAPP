

// data/repositories/tasks_repository.dart
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../../domain/entites/task.dart';
 

abstract class TasksRepository {
  Future<List<Task>> getAllTasks();
  Future<void> addTask(Task task);
  Future<void> toggleTaskCompletion(Task task);
  Future<void> deleteTask(String taskId);
}

class SqliteTasksRepository implements TasksRepository {
  late Database _db;

  Future<void> init() async {
    _db = await openDatabase(
      join(await getDatabasesPath(), 'tasks_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE tasks(id TEXT PRIMARY KEY, title TEXT, description TEXT, isCompleted INTEGER)',
        );
      },
      version: 1,
    );
  }

  @override
  Future<List<Task>> getAllTasks() async {
    final List<Map<String, dynamic>> maps = await _db.query('tasks');
    return List.generate(maps.length, (i) {
      return Task(
        id: maps[i]['id'],
        title: maps[i]['title'],
        description: maps[i]['description'],
        isCompleted: maps[i]['isCompleted'] == 1,
      );
    });
  }

  @override
  Future<void> addTask(Task task) async {
    await _db.insert(
      'tasks',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> toggleTaskCompletion(Task task) async {
    await _db.update(
      'tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }


  Future<void> deleteTask(String taskId) async {

    await _db.delete(
       'tasks',
      where: 'id = ?',
      whereArgs: [taskId],
    );
  }

}