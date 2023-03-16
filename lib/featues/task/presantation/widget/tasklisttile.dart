
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constant.dart';
import '../../domain/entites/task.dart';
import '../provider/taskdata.dart';


class TaskListTile extends StatelessWidget {
  const TaskListTile({
    super.key,
    required this.task, required this.taskData,

  });
  final taskData;
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {
          return Dismissible(key:Key(task.title),
            child:Card(child: ListTile(
              title: Text(task.title),
              subtitle: Text(task.description),
              trailing: Checkbox(
                value: task.isCompleted,
                onChanged: (value) {
                  taskData.toggleTaskCompletion(
                    Task(
                      id: task.id,
                      title: task.title,
                      description: task.description,
                      isCompleted: value!,
                    ),
                  );
                },
              ),
              onTap: () {
                /* Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TaskDetailScreen(task: task,taskData:taskData),
              ),
            );*/
              },
            ),
              shadowColor:kblue,
              elevation:1,),
            onDismissed: (DismissDirection dir) {
              Provider.of<TaskData>(context, listen: false).deleteTask(task.id);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      dir == DismissDirection.startToEnd
                          ? '${task.title} removed.'
                          : ''
                  ),
                  action: SnackBarAction(
                    label: 'UNDO',
                    onPressed: () {
                      Provider.of<TaskData>(context, listen: false).addTask(task);
                    },
                  ),

                ),
              );
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerLeft,
                child: const Icon(Icons.delete),
              );
            },
          );
        }
    );
  }
}