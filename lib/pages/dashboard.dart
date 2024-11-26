import 'package:flutter/material.dart';
import 'package:sbank/widgets/bottom_navigation.dart';

import '../constants.dart';
import 'package:sbank/pages/login.dart';
import 'package:sbank/pages/dashboard.dart';

final ButtonStyle RegisterButtonStyle = TextButton.styleFrom(
  foregroundColor: Colors.white,
  minimumSize: const Size(150, 50),
  padding: const EdgeInsets.symmetric(horizontal: 16.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(50.0)),
  ),
  backgroundColor: const Color.fromRGBO(36, 36, 36, 1),
);

final ButtonStyle LoginButtonStyle = TextButton.styleFrom(
  minimumSize: const Size(150, 50),
  padding: const EdgeInsets.symmetric(horizontal: 16.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(50.0)),
  ),
  backgroundColor: Colors.white,
  foregroundColor: const Color.fromRGBO(36, 36, 36, 1),
);

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    double Height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: primaryGreen,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: Height / 2,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "images/bg-spiral.png",
                  )),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Text("Banking made beautifully simple",
                    style: TextStyle(
                      fontSize: 50,
                      height: 1.2,
                      fontWeight: FontWeight.w500,
                    )),
                const SizedBox(height: 10.0),
                const Text(
                    "A modern design that elevates your banking journey. Manage your finances with flux."),
                const SizedBox(height: 50.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      style: LoginButtonStyle,
                      child: const Text("Log in",
                          style: TextStyle(fontWeight: FontWeight.w300)),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                    ),
                    const SizedBox(width: 20),
                    TextButton(
                      style: RegisterButtonStyle,
                      child: const Text("Register",
                          style: TextStyle(fontWeight: FontWeight.w300)),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/register');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
