
  import 'package:todoaql/featues/task/data/repository/taskrepository.dart';

class DeleteTaskUsecase {
  final TasksRepository repository;

  DeleteTaskUsecase(this.repository);
  Future<void> call(String taskId){
    return repository.deleteTask(taskId);
  }
}