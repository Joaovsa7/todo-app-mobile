import 'package:flutter/material.dart';
import 'package:todo_app/widgets/header.dart';
import 'package:email_validator/email_validator.dart';

class CreateTask extends StatefulWidget {
  CreateTask({Key key}) : super(key: key);

  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final _formKey = GlobalKey<FormState>();
  final formData = new Map();
  String dueDate;

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
    ).then((date) {
      if (date != null) {
        setState(() {
          dueDate = date.toString();
        });
      }
      return date;
    });
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
                              formData['firstName'] = value;
                            },
                            decoration: inputStyle('Name', 'Buy an ferrari'),
                          ),
                          TextFormField(
                            textAlign: TextAlign.left,
                            validator: (value) => _defaultFieldValidator(value),
                            onChanged: (value) {
                              formData['firstName'] = value;
                            },
                            decoration: inputStyle(
                              'Resume',
                              'i will buy an ferrari to drive',
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
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
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    dueDate == null ? 'Set due date' : dueDate,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.timer),
                                  onPressed: () {
                                    selectDate(context);
                                  },
                                )
                              ],
                            ),
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
