import 'package:flutter/material.dart';
import 'package:todoaql/featues/task/domain/usecases/addtaskusecase.dart';
import 'package:todoaql/featues/task/domain/usecases/deletetaskusecas.dart';
import 'package:todoaql/featues/task/domain/usecases/updatetask.dart';
import 'package:provider/provider.dart';
import 'featues/task/data/repository/taskrepository.dart';
import 'featues/task/domain/usecases/get_all_tasks.dart';
import 'featues/task/presantation/pages/tasklistscreen.dart';
import 'featues/task/presantation/provider/taskdata.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final tasksRepository = SqliteTasksRepository();
  await tasksRepository.init();
  final getAllTasksUsecase = GetAllTasksUsecase(tasksRepository);
  final addTaskUseCase=AddTaskUsecase(tasksRepository);
  final deleteTaskUseCase=DeleteTaskUsecase(tasksRepository);
  final toggleTaskUseCase=ToggleTaskCompletionUsecase(tasksRepository);
  final taskData = TaskData(getAllTasksUsecase:getAllTasksUsecase, addTaskUsecase:addTaskUseCase,
    toggleTaskCompletionUsecase: toggleTaskUseCase, deleteTaskUsecase:deleteTaskUseCase,

  );

  runApp(MyApp(taskData));
}

class MyApp extends StatelessWidget {
  final TaskData taskData;

  MyApp(this.taskData);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) =>taskData ,
     child: MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TaskListScreen(),
    ),
    );
  }
}
