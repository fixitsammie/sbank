import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sbank/constants.dart';
import 'package:sbank/providers/auth.dart';
import 'package:sbank/util/widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  String _name = '', _email = '', _password = '', _confirmPassword = '';
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    foregroundColor: Colors.white,
    minimumSize: const Size(88, 44),
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    ),
    backgroundColor: const Color.fromRGBO(36, 36, 36, 1),
  );

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    final nameField = TextFormField(
      autofocus: false,
      validator: (value) =>
          value!.length < 3 ? "Username length is less than 3" : null,
      onSaved: (value) => _name = value.toString(),
      decoration: simpleInputDecoration("Confirm password"),
    );
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
      onSaved: (value) => _password = value!,
      decoration: simpleInputDecoration("Confirm password"),
    );

    final confirmPassword = TextFormField(
      autofocus: false,
      validator: (value) => value!.isEmpty ? "Your password is required" : null,
      onSaved: (value) => _confirmPassword = value!,
      obscureText: true,
      decoration: simpleInputDecoration("Confirm password"),
    );

    var loading = const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Text(" Registering ... Please wait")
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
          child: const Text("Sign in",
              style: TextStyle(fontWeight: FontWeight.w300)),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
        ),
      ],
    );

    handleRegister() async {
      final form = formKey.currentState;
      if (form != null && form.validate()) {
        form.save();

        setState(() => isLoading = true);

        String? errorMessage = await auth.register(_name, _email, _password);

        setState(() => isLoading = false);

        if (errorMessage == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("User registered successfully!")),
          );
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.pushReplacementNamed(context, '/login');
          });
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
                  const SizedBox(height: 20.0),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Text("Register", style: pageHeader),
                  const SizedBox(height: 10.0),
                  label("Full Name"),
                  const SizedBox(height: 5.0),
                  nameField,
                  const SizedBox(height: 15.0),
                  label("Email"),
                  const SizedBox(height: 5.0),
                  emailField,
                  const SizedBox(height: 15.0),
                  label("Password"),
                  const SizedBox(height: 10.0),
                  passwordField,
                  const SizedBox(height: 15.0),
                  label("Confirm Password"),
                  const SizedBox(height: 10.0),
                  confirmPassword,
                  const SizedBox(height: 20.0),
                  auth.registeredInStatus == Status.Registering
                      ? loading
                      : longButtons("Register", handleRegister,
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
