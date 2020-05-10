import 'package:flutter/material.dart';
import '../components/loginForm.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            new Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'Todo App',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 36,
                            ),
                          ),
                          Text('Deal with daily tasks.'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            new Expanded(flex: 2, child: Container(child: FormLogin()))
          ],
        ),
      ),
    );
  }
}
