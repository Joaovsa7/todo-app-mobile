import 'package:flutter/material.dart';
import './screens/register.dart';
import './screens/homepage.dart';
import './screens/login.dart';

class TodoApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO APP',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/register': (context) => Register(),
        '/dashboard': (context) => HomePage(),
      },
    );
  }
}
