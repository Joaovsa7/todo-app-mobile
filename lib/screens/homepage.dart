import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/helpers/daysMap.dart';
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
    DateTime now = new DateTime.now();
    String dayNumber = DateTime.parse(now.toString()).weekday.toString();
    String todayName = dayMap[dayNumber];
    TimeOfDay _time = TimeOfDay.now();
    String formatedTime = _time.format(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.fromLTRB(15, 25, 15, 0),
          child: Column(
            children: <Widget>[
              Container(
                height: 100,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: new BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(2),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Welcome ${user?.firstName} ${user?.lastName}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          '$todayName, $formatedTime.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
