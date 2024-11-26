import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sbank/pages/localpage.dart';
import 'package:sbank/pages/network.dart';
import 'package:sbank/pages/user_dashboard.dart';
import 'package:sbank/pages/login.dart';
import 'package:sbank/pages/register.dart';
import 'package:sbank/pages/dashboard.dart';
import 'package:sbank/providers/auth.dart';
import './theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
          theme: lightThemeDataCustom,
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => const Dashboard(),
            '/login': (context) => const Login(),
            '/register': (context) => const Register(),
            '/local': (context) => const LocalPage(),
            '/home': (context) => const UserDashboard(),
            '/network': (context) => const Network(),
            '/search': (context) => const Network(),
            '/chat': (context) => const Network(),
            '/settings': (context) => const Network(),
          }),
    );
  }
}
