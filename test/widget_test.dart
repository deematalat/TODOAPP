// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todoaql/featues/task/data/repository/taskrepository.dart';
import 'package:todoaql/featues/task/domain/usecases/addtaskusecase.dart';
import 'package:todoaql/featues/task/domain/usecases/deletetaskusecas.dart';
import 'package:todoaql/featues/task/domain/usecases/get_all_tasks.dart';
import 'package:todoaql/featues/task/domain/usecases/updatetask.dart';
import 'package:todoaql/featues/task/presantation/provider/taskdata.dart';

import 'package:todoaql/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final tasksRepository = SqliteTasksRepository();
    final getAllTasksUsecase = GetAllTasksUsecase(tasksRepository);
    final addTaskUseCase=AddTaskUsecase(tasksRepository);
    final deleteTaskUseCase=DeleteTaskUsecase(tasksRepository);
    final toggleTaskUseCase=ToggleTaskCompletionUsecase(tasksRepository);
    final taskData = TaskData(getAllTasksUsecase:getAllTasksUsecase, addTaskUsecase:addTaskUseCase,
      toggleTaskCompletionUsecase: toggleTaskUseCase, deleteTaskUsecase:deleteTaskUseCase,

    );
    await tester.pumpWidget(  MyApp(taskData));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
