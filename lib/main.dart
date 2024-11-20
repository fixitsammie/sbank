import 'package:flutter/material.dart';
import 'package:sbank/pages/user_dashboard.dart';
import 'package:sbank/pages/login.dart';
import 'package:sbank/pages/register.dart';
import 'package:sbank/pages/dashboard.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       routes: {
            '/': (context) => const Dashboard(),
            '/login': (context) => const Login(),
            '/register': (context) => const Register(),
            '/home': (context) => const UserDashboard(),
            }
            );
  }
}
