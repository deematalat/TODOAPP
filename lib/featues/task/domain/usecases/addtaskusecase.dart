
import 'package:todoaql/featues/task/data/repository/taskrepository.dart';
import '../entites/task.dart';

class AddTaskUsecase {
  final TasksRepository repository;

  AddTaskUsecase(this.repository);
  Future<void> call(Task task){
    return repository.addTask(task);
  }
}