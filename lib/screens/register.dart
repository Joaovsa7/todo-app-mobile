import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import '../services/user.dart';

class Register extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final userService = new UserService();
  final formData = new Map();
  final globalKey = GlobalKey<ScaffoldState>();

  String _defaultFieldValidator(value) {
    if (value.trim().isEmpty) {
      return 'Fill this field.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Builder(
          builder: (BuildContext context) {
            return SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text(
                                      'Sign up',
                                      style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    IconButton(
                                      onPressed: () {
                                        return Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.navigate_before,
                                        size: 35,
                                      ),
                                      color: Colors.blue,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  textAlign: TextAlign.left,
                                  validator: (value) =>
                                      _defaultFieldValidator(value),
                                  onChanged: (value) {
                                    formData['firstName'] = value;
                                  },
                                  decoration: const InputDecoration(
                                      labelText: 'First name',
                                      hintText: "John",
                                      prefixIcon: Icon(
                                        Icons.person,
                                        size: 14,
                                      ),
                                      hintStyle: TextStyle(fontSize: 12)),
                                ),
                                TextFormField(
                                  textAlign: TextAlign.left,
                                  validator: (value) =>
                                      _defaultFieldValidator(value),
                                  onChanged: (value) {
                                    formData['lastName'] = value;
                                  },
                                  decoration: const InputDecoration(
                                      labelText: 'Last name',
                                      hintText: "Doe",
                                      prefixIcon: Icon(
                                        Icons.person,
                                        size: 14,
                                      ),
                                      hintStyle: TextStyle(fontSize: 14)),
                                ),
                                TextFormField(
                                  textAlign: TextAlign.left,
                                  validator: (value) {
                                    final isValid =
                                        EmailValidator.validate(value);
                                    if (!isValid) {
                                      return 'This email is not correct.';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    formData['email'] = value;
                                  },
                                  decoration: const InputDecoration(
                                      labelText: 'Email',
                                      hintText: "google@gmail.com",
                                      prefixIcon: Icon(
                                        Icons.email,
                                        size: 14,
                                      ),
                                      hintStyle: TextStyle(fontSize: 14)),
                                  keyboardType: TextInputType.text,
                                ),
                                TextFormField(
                                  textAlign: TextAlign.left,
                                  validator: (value) =>
                                      _defaultFieldValidator(value),
                                  onChanged: (value) {
                                    formData['password'] = value;
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'Password',
                                    hintText: "google@gmail.com",
                                    prefixIcon: Icon(
                                      Icons.vpn_key,
                                      size: 14,
                                    ),
                                    hintStyle: TextStyle(fontSize: 14),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              RaisedButton(
                                color: Colors.blue,
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    // If the form is valid, display a snackbar. In the real world,
                                    // you'd often call a server or save the information in a database.
                                    var loginResponse =
                                        await userService.register(formData);
                                    var hasError =
                                        loginResponse.error.isNotEmpty;

                                    if (hasError) {
                                      return Scaffold.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(loginResponse.error),
                                        ),
                                      );
                                    }

                                    if (loginResponse.auth) {
                                      return Navigator.pushNamed(
                                          context, '/dashboard');
                                    }
                                  }

                                  return null;
                                },
                                child: Text(
                                  'Register',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
