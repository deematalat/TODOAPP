

import 'package:todoaql/featues/task/data/repository/taskrepository.dart';

import '../entites/task.dart';

class GetAllTasksUsecase {
  final TasksRepository repository;

  GetAllTasksUsecase(this.repository);
  Future<List<Task>> call(){
    return repository.getAllTasks();
  }
}