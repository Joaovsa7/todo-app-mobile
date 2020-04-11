import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/widgets/header.dart';

class TodoDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TasksModel task = ModalRoute.of(context).settings.arguments;

    return SafeArea(
        child: Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(15, 25, 15, 0),
        child: Column(
          children: <Widget>[
            headerApp(context, task.title),
            Row(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Description',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(task.description)
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
