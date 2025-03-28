import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sbank/firebase_options1.dart';
import 'package:sbank/pages/authguard.dart';
import 'package:sbank/pages/support.dart';
import 'package:sbank/pages/homepage.dart';
import 'package:sbank/pages/localpage.dart';
import 'package:sbank/pages/network.dart';
import 'package:sbank/pages/settings.dart';
import 'package:sbank/pages/stats.dart';
import 'package:sbank/pages/user_dashboard.dart';
import 'package:sbank/pages/login.dart';
import 'package:sbank/pages/register.dart';
import 'package:sbank/pages/dashboard.dart';
import 'package:sbank/providers/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          // theme: lightThemeDataCustom,
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => const AuthGuard(),
            '/dashboard': (context) => const Dashboard(),
            '/a': (context) => const AuthGate(),
            '/login': (context) => const Login(),
            '/register': (context) => const Register(),
            '/local': (context) => const LocalPage(),
            '/home': (context) => const UserDashboard(),
            '/network': (context) => const Network(),
            '/search': (context) => const Network(),
            '/chat': (context) => const Network(),
            '/settings': (context) => const Settings(),
            '/stats': (context) => const Stats(),
            '/support': (context) => const Support(),
          }),
    );
  }
}
