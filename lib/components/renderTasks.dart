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
  String token;
  List<TasksModel> tasks = [];

  @override
  void initState() {
    super.initState();
    _getUserAndTasks();
  }

  void _deleteTask(String id, String token) async {
    var message = await tasksService.delete(id, token);
    _getUserAndTasks();
    return null;
  }

  _getUserAndTasks() async {
    User user = User.fromJson(await sharedPref.read('userData'));
    var tasksOfUser = await tasksService.getByUser(user.id, user.token);
    setState(() {
      token = user.token;
      tasks = tasksOfUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 5, 0, 30),
        width: double.infinity,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: tasks.length,
          itemBuilder: (BuildContext context, int index) {
            String title = tasks[index].title;
            String description = tasks[index].description;
            String id = tasks[index].id;
            bool taskDone = tasks[index].done;
            return Dismissible(
              key: Key('$tasks[index].hashCode'),
              background: Container(
                color: Colors.blue,
              ),
              secondaryBackground: Container(
                color: Colors.red,
                child: Icon(Icons.ac_unit),
              ),
              onDismissed: (direction) async {
                _deleteTask(id, token);
                setState(() {
                  tasks = tasks.removeAt(index) as List<TasksModel>;
                });
              },
              child: Card(
                child: ListTile(
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        taskDone ? Icons.done : Icons.clear,
                        color: taskDone ? Colors.green : Colors.red,
                        size: 16,
                      )
                    ],
                  ),
                  trailing: Icon(
                    Icons.arrow_forward,
                    size: 16,
                  ),
                  dense: true,
                  title: Text(title),
                  subtitle: Text(description),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
