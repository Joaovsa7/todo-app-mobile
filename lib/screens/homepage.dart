import 'package:flutter/material.dart';
import 'package:todo_app/models/user.dart';
import '../components/renderTasks.dart';
import '../services/sharedPref.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User user;
  void _getUserData(state) async {
    SharedPref sharedPref = SharedPref();
    User userData = User.fromJson(await sharedPref.read('userData'));
    setState(() {
      user = userData;
    });
    return null;
  }

  @override
  void initState() {
    super.initState();
    _getUserData(user);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.fromLTRB(15, 25, 15, 0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Welcome ${user?.firstName} ${user?.lastName}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'All Tasks',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w100),
                      ),
                    ],
                  )
                ],
              ),
              Tasks(),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.black87,
          label: Text('Add a task'),
          icon: Icon(Icons.add),
          onPressed: () {
            return Navigator.pushNamed(context, '/create');
          },
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
