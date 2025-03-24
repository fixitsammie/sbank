import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sbank/providers/auth.dart';

import '../util/widgets.dart';
import '../constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  String _email = '', _password = '';
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    foregroundColor: Colors.white,
    minimumSize: const Size(88, 44),
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
    backgroundColor: const Color.fromARGB(255, 13, 139, 11),
  );

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    final emailField = TextFormField(
      autofocus: false,
      validator: (value) =>
          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value.toString())
              ? "Invalid email"
              : null,
      onSaved: (value) => _email = value.toString(),
      decoration: simpleInputDecoration("Confirm password"),
    );

    final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      validator: (value) => value!.isEmpty ? "Please enter password" : null,
      onSaved: (value) => _password = value.toString(),
      decoration: simpleInputDecoration("Confirm password"),
    );

    var loading = const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Text(" Authenticating ... Please wait")
      ],
    );

    final forgotLabel = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          child: const Text("Forgot password?",
              style: TextStyle(fontWeight: FontWeight.w300)),
          onTap: () {},
        ),
        GestureDetector(
          child: const Text("Sign up",
              style: TextStyle(fontWeight: FontWeight.w300)),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/register');
          },
        ),
      ],
    );
    handleLogin() async {
      final form = formKey.currentState;

      if (form != null && form.validate()) {
        form.save();

        setState(() => isLoading = true);

        String? errorMessage = await auth.login(_email, _password);

        setState(() => isLoading = false);

        if (errorMessage == null) {
          Future.delayed(const Duration(seconds: 2), () {});
          if (mounted) {
            await Navigator.pushReplacementNamed(context, '/home');

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: const Text("Login successful!")),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errorMessage)),
          );
        }
      }
    }

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
                      "assets/images/bg-spiral.png",
                      height: 200,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text("Login", style: pageHeader),
                  const SizedBox(height: 10.0),
                  label("Email"),
                  const SizedBox(height: 5.0),
                  emailField,
                  const SizedBox(height: 20.0),
                  label("Password"),
                  const SizedBox(height: 5.0),
                  passwordField,
                  const SizedBox(height: 20.0),
                  auth.loggedInStatus == Status.Authenticating
                      ? loading
                      : longButtons("Login", handleLogin,
                          color: primaryGreen, textColor: authButtonTextColor),
                  const SizedBox(height: 5.0),
                  forgotLabel,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
