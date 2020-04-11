import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/models/user.dart';
import 'package:todo_app/screens/details.dart';
import '../services/task.dart';
import '../services/sharedPref.dart';

class Tasks extends StatefulWidget {
  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  final tasksService = new TaskService();
  final sharedPref = SharedPref();
  bool loading = false;
  String token;
  List<TasksModel> tasks = [];

  @override
  void initState() {
    super.initState();
    _getUserAndTasks();
  }

  Future<TasksModel> _deleteTask(String id, String token) async {
    TasksModel response = await tasksService.delete(id, token);
    return response;
  }

  _getUserAndTasks() async {
    setState(() {
      loading = true;
    });
    User user = User.fromJson(await sharedPref.read('userData'));
    var tasksOfUser = await tasksService.getByUser(user.id, user.token);
    setState(() {
      token = user.token;
      tasks = tasksOfUser;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
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
              background: dismissableIcon(
                context,
                EdgeInsets.only(left: 20),
                Icons.check,
                Colors.green,
                CrossAxisAlignment.start,
              ),
              secondaryBackground: dismissableIcon(
                context,
                EdgeInsets.only(right: 20),
                Icons.clear,
                Colors.red,
                CrossAxisAlignment.end,
              ),
              onDismissed: (direction) async {
                if (direction == DismissDirection.startToEnd) {
                  return null;
                }
                TasksModel response = await _deleteTask(id, token);
                var finalResponse =
                    response.error != null ? response.error : response.message;
                setState(() {
                  tasks.removeAt(index);
                });

                return Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text(finalResponse)));
              },
              child: Card(
                child: ListTile(
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        taskDone != false ? Icons.done : Icons.clear,
                        color: taskDone != false ? Colors.green : Colors.red,
                        size: 16,
                      )
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.arrow_forward,
                      size: 16,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Details(),
                            settings: RouteSettings(
                              arguments: tasks[index],
                            ),
                          ));
                    },
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

Widget dismissableIcon(BuildContext context, EdgeInsets margin, IconData icon,
    Color iconColor, CrossAxisAlignment horizontalAlign) {
  return Container(
    margin: margin,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: horizontalAlign,
      children: <Widget>[
        Icon(
          icon,
          color: iconColor,
          size: 34,
        )
      ],
    ),
  );
}
