

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoaql/core/constant.dart';
import '../../domain/entites/task.dart';
import '../provider/taskdata.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Title',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:kblue),
                  borderRadius: BorderRadius.circular(20.0),
                ),


              ),

            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: _descriptionController,
              decoration:InputDecoration(
                hintText: 'Description',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:kblue),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor:Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                final task = Task(
                  id: DateTime.now().toString(),
                  title: _titleController.text,
                  description: _descriptionController.text,
                  isCompleted: false,
                );
                Provider.of<TaskData>(context, listen: false).addTask(task);
                if(_titleController.text.isNotEmpty){
                Navigator.pop(context);}
              },
              child: Text('Add Task',style:TextStyle(
                color: kblue,
                fontSize:18

              ),),
            ),
          ],
        ),
      ),
    );
  }
}