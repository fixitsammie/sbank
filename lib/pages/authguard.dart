import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';

class AuthGuard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    if (authProvider.user == null) {
      Future.microtask(() => Navigator.pushReplacementNamed(context, '/dashboard'));
    } else {
      Future.microtask(() => Navigator.pushReplacementNamed(context, '/home'));
    }

    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
