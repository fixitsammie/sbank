import 'package:flutter/material.dart';

import '../util/widgets.dart';

class LocalPage extends StatefulWidget {
  const LocalPage({Key? key}) : super(key: key);

  @override
  _LocalPageState createState() => _LocalPageState();
}

class _LocalPageState extends State<LocalPage> {
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
          Text("LocalPage"),
        ],
      ),
    ))));
  }
}
