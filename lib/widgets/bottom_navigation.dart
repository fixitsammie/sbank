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
        _url = '/search';
        break;

      case 2:
        _url = '/cart';
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
        BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search)),
        BottomNavigationBarItem(label: "Chat", icon: Icon(Icons.forum)),
        BottomNavigationBarItem(label: "Settings", icon: Icon(Icons.settings)),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
