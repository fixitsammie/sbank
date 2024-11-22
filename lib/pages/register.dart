import 'package:flutter/material.dart';

import '../utils/widgets.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Container(
      child: Column(
        children: [
          GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Text("User Dashboard")),
          GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/network');
              },
              child: Text("Network")),
          Text("Register"),
        ],
      ),
    ))));
  }
}
