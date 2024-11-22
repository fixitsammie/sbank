import 'package:flutter/material.dart';

import '../util/widgets.dart';
import '../constants.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  String _username = '', _password = '';
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    foregroundColor: Colors.white,
    minimumSize: const Size(88, 44),
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
    backgroundColor: const Color.fromRGBO(36, 36, 36, 1),
  );

  @override
  Widget build(BuildContext context) {
    final usernameField = TextFormField(
      autofocus: false,
      validator: (value) =>
          value!.length < 8 ? "Username length is less than 8" : null,
      onSaved: (value) => _username = value.toString(),
      decoration: simpleInputDecoration("Confirm password"),
    );

    final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      validator: (value) => value!.isEmpty ? "Please enter password" : null,
      onSaved: (value) => _password = value.toString(),
      decoration: simpleInputDecoration("Confirm password"),
    );

    var loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        CircularProgressIndicator(),
        Text(" Authenticating ... Please wait")
      ],
    );

    final forgotLabel = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TextButton(
          style: flatButtonStyle,
          child: const Text("Forgot password?",
              style: TextStyle(fontWeight: FontWeight.w300)),
          onPressed: () {
//            Navigator.pushReplacementNamed(context, '/reset-password');
          },
        ),
        TextButton(
          style: flatButtonStyle,
          child: const Text("Sign up",
              style: TextStyle(fontWeight: FontWeight.w300)),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/register');
          },
        ),
      ],
    );

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(40.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80.0),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "images/bg-spiral.png",
                      height: 200,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text("Login", style: pageHeader),
                  const SizedBox(height: 10.0),
                  label("Username"),
                  const SizedBox(height: 5.0),
                  usernameField,
                  const SizedBox(height: 20.0),
                  label("Password"),
                  const SizedBox(height: 5.0),
                  passwordField,
                  const SizedBox(height: 20.0),

                  /**   auth.loggedInStatus == Status.Authenticating
                      ? loading
                      : longButtons("Login", doLogin,
                          color: const Color.fromRGBO(36, 36, 36, 1)),
                  const SizedBox(height: 5.0),
                  forgotLabel*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
