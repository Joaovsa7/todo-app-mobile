import 'package:flutter/material.dart';
import '../components/renderTasks.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
  final title;
  final userId;
  HomePage({this.title, this.userId});
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: <Widget>[
            Task(
              title: widget.title,
              userId: widget.userId,
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.add),
              title: new Text('Add new Task'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text('Profile'))
          ],
        ),
      ),
    );
  }
}
