import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sbank/providers/auth.dart';
import 'package:sbank/util/widgets.dart';
import 'package:flutter_stack_toast/flutter_stack_toast.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();

  String _username = '', _password = '', _confirmPassword = '';
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
    AuthProvider auth = Provider.of<AuthProvider>(context);

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

    var loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        CircularProgressIndicator(),
        Text(" Registering ... Please wait")
      ],
    );

    final forgotLabel = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TextButton(
          style: flatButtonStyle,
          child: const Text("Forgot password?",
              style: TextStyle(fontWeight: FontWeight.w300)),
          onPressed: () {},
        ),
        TextButton(
          style: flatButtonStyle,
          child: const Text("Sign in",
              style: TextStyle(fontWeight: FontWeight.w300)),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
        ),
      ],
    );

    doRegister() {
      final form = formKey.currentState;
      if (form != null && form.validate()) {
        form.save();
        auth
            .register(_username, _password, _confirmPassword)
            .then((response) async {
          if (response['status']) {
            // User user = response['data'];
            // Provider.of<UserProvider>(context, listen: false).setUser(user);
            Navigator.pushReplacementNamed(context, '/login');
            //bool result = await Navigator.of(context).pushNamed(context,'/login');

            FlutterToast.showStackTextToast(
                context,
                Text("New account created",
                    style: TextStyle(color: Colors.black, fontSize: 15)));
          } else {
            FlutterToast.showStackTextToast(
                context,
                Text(response['message'].toString(),
                    style: TextStyle(color: Colors.black, fontSize: 15)));
          }
        });
      } else {
        FlutterToast.showStackTextToast(
            context,
            Text("Invalid form",
                style: TextStyle(color: Colors.black, fontSize: 15)));
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
                      "assets/images/sbankLogo.png",
                      height: 200,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  label("Username"),
                  const SizedBox(height: 5.0),
                  usernameField,
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
                      : longButtons("Register", doRegister,
                          color: const Color.fromRGBO(36, 36, 36, 1)),
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
