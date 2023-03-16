

import 'package:flutter/material.dart';
import '../../domain/entites/task.dart';
import '../../domain/usecases/addtaskusecase.dart';
import '../../domain/usecases/deletetaskusecas.dart';
import '../../domain/usecases/get_all_tasks.dart';
import '../../domain/usecases/updatetask.dart';


class TaskData extends ChangeNotifier {
  final GetAllTasksUsecase getAllTasksUsecase;
  final AddTaskUsecase addTaskUsecase;
  final ToggleTaskCompletionUsecase toggleTaskCompletionUsecase;
  final DeleteTaskUsecase deleteTaskUsecase;
  List<Task> _tasks = [];

  TaskData({
    required this.getAllTasksUsecase,
    required this.addTaskUsecase,
    required this.toggleTaskCompletionUsecase,
    required this.deleteTaskUsecase,
  });

  List<Task> get tasks => _tasks;

  Future<void> getAllTasks() async {
    _tasks = await getAllTasksUsecase();
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    await addTaskUsecase(task);
    _tasks.add(task);
    notifyListeners();
  }

  Future<void> toggleTaskCompletion(Task task) async {
    await toggleTaskCompletionUsecase(task);
    final index = _tasks.indexWhere((t) => t.id == task.id);
    _tasks[index] = task;
    notifyListeners();
  }

  Future<void> deleteTask( String taskId) async {
    await deleteTaskUsecase(taskId);
    _tasks.removeWhere((t) => t.id ==taskId);
    notifyListeners();
  }
}
