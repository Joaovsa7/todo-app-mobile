import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/models/user.dart';
import 'package:todo_app/services/sharedPref.dart';
import 'package:todo_app/services/task.dart';
import 'package:todo_app/widgets/header.dart';
import 'dart:core';

class CreateTask extends StatefulWidget {
  CreateTask({Key key}) : super(key: key);

  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final _formKey = GlobalKey<FormState>();
  final formData = new Map();
  String dueDate;
  String dueTime;

  final _taskService = new TaskService();

  String _defaultFieldValidator(value) {
    if (value.trim().isEmpty) {
      return 'Fill this field.';
    }
    return null;
  }

  inputStyle(
    String title,
    String hint,
  ) {
    return InputDecoration(
      labelText: title,
      hintText: hint,
      hintStyle: TextStyle(fontSize: 12),
    );
  }

  Future<Null> selectDate(BuildContext context) async {
    DateTime _date = DateTime.now();
    final DateTime pickedDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1970),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != dueDate) {
      String formatedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      setState(() {
        dueDate = formatedDate;
      });
    }
  }

  Future<Null> selectTime(BuildContext context) async {
    TimeOfDay _time = TimeOfDay.now();
    TimeOfDay pickedTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (pickedTime != null && pickedTime != dueTime) {
      String formatedSelectedTime = pickedTime.format(context);
      setState(() {
        dueTime = formatedSelectedTime;
      });
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(children: <Widget>[
                    headerApp(context, 'New task'),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            textAlign: TextAlign.left,
                            validator: (value) => _defaultFieldValidator(value),
                            onChanged: (value) {
                              formData['title'] = value;
                            },
                            decoration: inputStyle('Name', 'Buy an ferrari'),
                          ),
                          TextFormField(
                            textAlign: TextAlign.left,
                            validator: (value) => _defaultFieldValidator(value),
                            onChanged: (value) {
                              formData['resume'] = value;
                            },
                            decoration: inputStyle(
                              'Resume',
                              'i will buy an ferrari to drive',
                            ),
                          ),
                          timeCard(
                              context, Icons.date_range, selectDate, dueDate),
                          timeCard(
                              context, Icons.access_time, selectTime, dueTime,
                              marginTop: 0),
                          TextFormField(
                            minLines: 1,
                            maxLines: 4,
                            onChanged: (value) {
                              formData['description'] = value;
                            },
                            decoration: inputStyle(
                              'Description',
                              'Oh my god, with my ferrari i will do a lot of trips',
                            ),
                          ),
                          RaisedButton(
                            child: Text('Create'),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                SharedPref _sharedPref = SharedPref();
                                User userData = User.fromJson(
                                    await _sharedPref.read('userData'));

                                Map<String, dynamic> taskData = {
                                  ...formData,
                                  'dueDate': dueDate,
                                  'dueTime': dueTime,
                                  'userId': userData.id
                                };

                                var response = await _taskService.create(
                                    taskData, userData.token);

                                if (response.message != null) {
                                  return Navigator.pushNamed(
                                      context, '/dashboard');
                                }
                              }
                              return null;
                            },
                          )
                        ],
                      ),
                    ),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget timeCard(
    BuildContext context, IconData icon, Function onPressed, String state,
    {double marginTop}) {
  double topMargin = marginTop != null ? marginTop : 15;
  return Container(
    margin: EdgeInsets.fromLTRB(0, topMargin, 0, 15),
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
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 5),
                child: Icon(icon),
              ),
              Text(state == null ? 'Not set' : state)
            ],
          ),
        ),
        FlatButton(
          onPressed: () {
            onPressed(context);
          },
          child: Text('Change'),
        )
      ],
    ),
  );
}
