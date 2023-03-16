// presentation/screens/task_list_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoaql/core/constant.dart';
import '../../domain/entites/task.dart';
import '../provider/taskdata.dart';
import '../widget/addtask.dart';
import '../widget/tasklisttile.dart';

class TaskListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [kblue,kpurple ],
          ),
        ),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
          SizedBox(height:10),
        Padding(padding:EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius:32,
            child: IconButton(onPressed: (){}, icon:Icon(Icons.menu,size:32,color:kblue,),
              color: Colors.blue,
            ),
          ),),
        Padding(padding: EdgeInsets.all(10),
        child:Text("Manage your time",style:ktitle,)
        ),
        Spacer(),
        Container(
          padding:EdgeInsets.all(16),
          width:double.infinity,
          height:550,
          decoration:BoxDecoration(
            color: Colors.white,
            borderRadius:BorderRadius.only(
              topRight:Radius.circular(25),
              topLeft:Radius.circular(25),
            )
          ),
       child: Column(

          children: [
            SizedBox(height:30,),
            Consumer<TaskData>(
                builder:(context, taskData, child){
                  int len=taskData.tasks.length;
                 return (len!=0)? Text("There\s $len tasks for today",style: ksub,):
                 Text("There\s no task for today",style:ksub);
                }
            ),
            Consumer<TaskData>(
                  builder: (context, taskData, child) {
                    return (taskData.tasks.length!=0)?
                      Expanded(child:
                    ListView.builder(
                      itemCount: taskData.tasks.length,
                      itemBuilder: (context, index) {
                        final task = taskData.tasks[index];
                        return TaskListTile(task:   Task(
                          id: task.id,
                          title: task.title,
                          description: task.description,
                          isCompleted:task.isCompleted,
                        ), taskData:taskData,
                        );

                      },
                    )):
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(height:100,),
                             Image.asset('assets/01_ramen_character.gif')
                          ],
                        );
                  },
                ),
          ],
        ),
        )
          ]
      ),
    ),),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          showModalBottomSheet(context: context, builder:(context)=>
          AddTaskScreen()
          );
        },
        child: Icon(Icons.add,color:kblue,),
      ),
    );
  }
}