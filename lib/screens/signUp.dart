import 'package:flutter/material.dart';
import '../services/user.dart';

class SignUp extends StatelessWidget {
  String _defaultFieldValidator(value) {
    if (value.isEmpty) {
      return 'Fill this field.';
    }
    return null;
  }

  final _formKey = GlobalKey<FormState>();
  final userService = new UserService();
  var formData = {};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.all(20),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            textAlign: TextAlign.left,
                            validator: (value) => _defaultFieldValidator(value),
                            onChanged: (value) {
                              formData = {...formData, 'firstName': value};
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
                            validator: (value) => _defaultFieldValidator(value),
                            onChanged: (value) {
                              formData = {...formData, 'lastName': value};
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
                            validator: (value) => _defaultFieldValidator(value),
                            onChanged: (value) {
                              formData = {...formData, 'email': value};
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
                            validator: (value) => _defaultFieldValidator(value),
                            onChanged: (value) {
                              formData = {...formData, 'password': value};
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
                              print(loginResponse.data.firstName);
                              Scaffold.of(context).showSnackBar(
                                  SnackBar(content: Text('Processing Data')));
                            }
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
      ),
    );
  }
}
