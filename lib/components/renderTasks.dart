import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/models/user.dart';
import '../services/task.dart';
import '../services/sharedPref.dart';

class Tasks extends StatefulWidget {
  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  final tasksService = new TaskService();
  final sharedPref = SharedPref();
  List<TasksModel> tasks = [];

  @override
  void initState() {
    super.initState();
    _setTasksState();
  }

  _setTasksState() async {
    User user = User.fromJson(await sharedPref.read('userData'));
    var tasksOfUser = await tasksService.getTasksOfUser(user.id);
    setState(() {
      tasks = tasksOfUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: tasks.length,
          itemBuilder: (BuildContext context, int index) {
            String title = tasks[index].title;
            String description = tasks[index].description;
            bool taskDone = tasks[index].done;
            return Card(
              child: ListTile(
                leading: Icon(
                  taskDone ? Icons.done : Icons.clear,
                  color: taskDone ? Colors.green : Colors.red,
                ),
                dense: true,
                title: Text(title),
                subtitle: Text(description),
              ),
            );
          },
        ),
      ),
    );
  }
}
