import 'package:flutter/material.dart';

import '../widgets/bottom_navigation.dart';

class Stats extends StatefulWidget {
  const Stats({super.key});

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Mybottom(num: 1),
        body: const SafeArea(child: Center(child: Text("Stats"))));
  }
}
