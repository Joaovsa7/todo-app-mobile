import 'package:flutter/material.dart';
import '../services/task.dart';

class Task extends StatefulWidget {
  @override
  _TaskState createState() => _TaskState();
  final userId;
  Task({this.userId});
}

class _TaskState extends State<Task> {
  final tasksService = new TaskService();
  List tasks = [];
  @override
  void initState() {
    super.initState();
    _setTasksState();
  }

  _setTasksState() async {
    var tasksOfUser = await tasksService.getTasksOfUser(widget.userId);
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
