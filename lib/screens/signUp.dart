import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  String _defaultFieldValidator(value) {
    if (value.isEmpty) {
      return 'Fill this field.';
    }
    return null;
  }

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
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextFormField(
                      textAlign: TextAlign.left,
                      validator: (value) => _defaultFieldValidator(value),
                      decoration: const InputDecoration(
                          labelText: 'First name',
                          hintText: "John",
                          prefixIcon: Icon(
                            Icons.email,
                            size: 14,
                          ),
                          hintStyle: TextStyle(fontSize: 12)),
                    ),
                    TextFormField(
                      textAlign: TextAlign.left,
                      validator: (value) => _defaultFieldValidator(value),
                      decoration: const InputDecoration(
                          labelText: 'Last name',
                          hintText: "Doe",
                          prefixIcon: Icon(
                            Icons.email,
                            size: 14,
                          ),
                          hintStyle: TextStyle(fontSize: 14)),
                    ),
                    TextFormField(
                      textAlign: TextAlign.left,
                      validator: (value) => _defaultFieldValidator(value),
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
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        hintText: "google@gmail.com",
                        prefixIcon: Icon(
                          Icons.email,
                          size: 14,
                        ),
                        hintStyle: TextStyle(fontSize: 14),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
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
