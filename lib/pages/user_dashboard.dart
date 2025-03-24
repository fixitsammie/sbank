// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sbank/pages/screens/stats_screen.dart';
import 'package:sbank/pages/screens/support_screen.dart';

import 'package:sbank/constants.dart';

import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/settings_screen.dart';
import '../constants.dart';

class UserDashboard extends StatefulWidget {
  final int selectedIndex;

  const UserDashboard({Key? key, this.selectedIndex = 0}) : super(key: key);
  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  late int _selectedIndex;

  final List<String> _routes = ['/home', '/profile', '/settings'];

  final List<Widget> _screens = const [
    HomeScreen(),
    StatsScreen(),
    SupportScreen(),
    SettingsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex =
        widget.selectedIndex; // Set initial index from the passed argument
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: navBarBackgroundColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: activeBottomNavColor,
          unselectedItemColor: inactiveBottomNavColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedLabelStyle: TextStyle(
            color: inactiveBottomNavColor,
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
          selectedLabelStyle: TextStyle(
            color: activeBottomNavColor,
            fontSize: 10,
            fontWeight: FontWeight.w700,
          ),
          selectedIconTheme: IconThemeData(color: activeBottomNavColor),
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: "Statistics", icon: Icon(Icons.bar_chart)),
            BottomNavigationBarItem(label: "Support", icon: Icon(Icons.forum)),
            BottomNavigationBarItem(
                label: "Settings", icon: Icon(Icons.settings)),
          ],
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ));
  }
}
