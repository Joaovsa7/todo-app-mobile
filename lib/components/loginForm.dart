import 'package:flutter/material.dart';
import '../services/sharedPref.dart';
import '../services/user.dart';

class FormLogin extends StatefulWidget {
  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userService = new UserService();
  final sharedPref = SharedPref();

  bool isLoading = false;

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
                  color: Theme.of(context).primaryColor,
                  onPressed: !isLoading
                      ? () async {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            var loginResponse = await userService
                                .login(emailController.text.trim(),
                                    passwordController.text.trim())
                                .catchError((err) {
                              print(err);
                              setState(() {
                                isLoading = false;
                              });
                            });

                            if (loginResponse.auth == false) {
                              setState(() {
                                isLoading = false;
                              });
                              return Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      'User not found, maybe the user or password are incorrect')));
                            }
                            var userData = loginResponse.user;
                            userData.token = loginResponse.token;
                            await sharedPref.save('userData', userData);
                            setState(() {
                              isLoading = false;
                            });
                            return Navigator.pushNamed(context, '/dashboard');
                          }
                          return null;
                        }
                      : null,
                  child: Text(isLoading ? 'Loading...' : 'Log in'),
                ),
              ),
              MaterialButton(
                child: Text("Don't have an account? click here."),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/register', ModalRoute.withName('/'));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
