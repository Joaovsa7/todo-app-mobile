import 'package:flutter/material.dart';
import '../services/sharedPref.dart';
import '../services/user.dart';

class FormLogin extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userService = new UserService();
  final sharedPref = SharedPref();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Container(
      margin: new EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: emailController,
                textAlignVertical: TextAlignVertical.bottom,
                textAlign: TextAlign.left,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Fill this field.';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: "Your email",
                  prefixIcon: Icon(
                    Icons.email,
                    size: 14,
                  ),
                  hintStyle: TextStyle(fontSize: 14),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                controller: passwordController,
                textAlign: TextAlign.left,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Fill this field.';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: "******",
                    prefixIcon: Icon(
                      Icons.lock,
                      size: 14,
                    ),
                    hintStyle: TextStyle(fontSize: 14)),
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: RaisedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      Scaffold.of(context)
                          .showSnackBar(SnackBar(content: Text('wait...')));

                      var loginResponse = await userService.login(
                          emailController.text.trim(),
                          passwordController.text.trim());

                      if (loginResponse.auth == false) {
                        return Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text(
                                'User not found, maybe the user or password are incorrect')));
                      }

                      var userData = loginResponse.user;
                      await sharedPref.save('userData', userData);
                      return Navigator.pushNamed(context, '/dashboard');
                    }
                    return null;
                  },
                  child: Text(
                    'Log in',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.blue,
                ),
              ),
              MaterialButton(
                child: Text("Don't have an account? click here."),
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
