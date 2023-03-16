
  import 'package:todoaql/featues/task/data/repository/taskrepository.dart';

import '../entites/task.dart';

class ToggleTaskCompletionUsecase {
  final TasksRepository repository;

  ToggleTaskCompletionUsecase(this.repository);
  Future<void> call(Task task){
    return repository.toggleTaskCompletion(task);
  }
}