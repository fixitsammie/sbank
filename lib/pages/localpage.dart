import 'package:flutter/material.dart';

class LocalPage extends StatefulWidget {
  const LocalPage({super.key});

  @override
  _LocalPageState createState() => _LocalPageState();
}

class _LocalPageState extends State<LocalPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: const Text("User Dashboard")),
          GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/network');
              },
              child: const Text("Network")),
          const Text("LocalPage"),
        ],
      ),
    )));
  }
}
