import 'package:flutter/material.dart';
import 'package:todo_app/screens/createTask.dart';
import './screens/register.dart';
import './screens/homepage.dart';
import './screens/login.dart';
import 'helpers/defineTheme.dart';

class TodoApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO APP',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: defineTheme('night'),
      routes: {
        '/': (context) => Login(),
        '/register': (context) => Register(),
        '/dashboard': (context) => HomePage(),
        '/create': (context) => CreateTask()
      },
    );
  }
}
