import 'package:flutter/material.dart';

import '../constants.dart';

class Mybottom extends StatefulWidget {
  final int num;
  Mybottom({Key? key, required this.num}) : super(key: key);

  @override
  MyBottomNavBar createState() => MyBottomNavBar();
}

class MyBottomNavBar extends State<Mybottom> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    var _url;
    switch (_selectedIndex) {
      case 0:
        _url = '/dashboard';
        break;

      case 1:
        _url = '/help';
        break;

      case 2:
        _url = '/settings';
        break;

      default:
        _url = '/dashboard';
    }
    Navigator.pushReplacementNamed(context, _url);
  }

  @override
  Widget build(BuildContext context) {
    _selectedIndex = widget.num;
    return BottomNavigationBar(
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
      items: const [
        BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
        BottomNavigationBarItem(
            label: "Statistics", icon: Icon(Icons.bar_chart)),
        BottomNavigationBarItem(label: "Support", icon: Icon(Icons.forum)),
        BottomNavigationBarItem(label: "Settings", icon: Icon(Icons.settings)),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
