import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/widgets/header.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TasksModel task = ModalRoute.of(context).settings.arguments;

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
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Text(
                              task.title,
                              style: TextStyle(
                                  fontSize: 36,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Resume of ${task.title}',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black45,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            task.resume,
                            style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.normal,
                            ),
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
