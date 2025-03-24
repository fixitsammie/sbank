import 'package:flutter/material.dart';
import 'package:sbank/pages/dashboard.dart';
import 'package:provider/provider.dart';
import 'package:sbank/providers/auth.dart';

import '../widgets/bottom_navigation.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      bottomNavigationBar: Mybottom(num: 3),
      body:SafeArea(child: Column(crossAxisAlignment:CrossAxisAlignment.start,children: [
       
       Center(child:LogoutButton()),
        
      ],),)
    );
  }
}


class LogoutButton extends StatefulWidget {
  @override
  _LogoutButtonState createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  Future<void> _handleLogout() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    await authProvider.logoutUser();

    if (mounted) { // ✅ No import needed, built-in for StatefulWidget
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {

    return   const Text("Logout",
                                    style: TextStyle(fontWeight: FontWeight.w300));
   
   
  }
}