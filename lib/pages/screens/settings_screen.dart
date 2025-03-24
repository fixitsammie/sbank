import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sbank/providers/auth.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                "assets/images/ella.jpg",
              ),
            ),
            SizedBox(height: 20),
            Center(child: LogoutButton()),
          ],
        ),
      ),
    );
  }
}

class LogoutButton extends StatefulWidget {
  const LogoutButton({super.key});

  @override
  _LogoutButtonState createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  Future<void> _handleLogout() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    await authProvider.logoutUser();

    if (mounted) {
      // ✅ No import needed, built-in for StatefulWidget
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleLogout,
      child:
          const Text("Logout", style: TextStyle(fontWeight: FontWeight.w300)),
    );
  }
}
