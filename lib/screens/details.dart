import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/widgets/header.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TasksModel task = ModalRoute.of(context).settings.arguments;

    const subtitleStyle = TextStyle(
      fontSize: 14,
      color: Colors.black26,
      fontWeight: FontWeight.bold,
    );

    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.fromLTRB(15, 25, 15, 0),
          child: Column(
            children: <Widget>[
              headerApp(context, 'Details of task'),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('TITLE', style: subtitleStyle),
                          Container(
                            child: Text(
                              task.title,
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          Container(
                            child: Text(
                              'RESUME',
                              style: subtitleStyle,
                            ),
                          ),
                          Text(
                            task.resume,
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            'DESCRIPTION',
                            style: subtitleStyle,
                          ),
                          Text(
                            task.description,
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            'STATUS',
                            style: subtitleStyle,
                          ),
                          Text(
                            task.done == true ? 'DONE' : 'UNDONE',
                            style: TextStyle(
                                color: task.done == true
                                    ? Colors.red
                                    : Colors.green),
                          ),
                        ],
                      ),
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(10),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
