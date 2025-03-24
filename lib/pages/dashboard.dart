import 'package:flutter/material.dart';
import '../constants.dart';

final ButtonStyle registerButtonStyle = TextButton.styleFrom(
  foregroundColor: Colors.white,
  minimumSize: const Size(150, 50),
  padding: const EdgeInsets.symmetric(horizontal: 16.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(50.0)),
  ),
  backgroundColor: const Color.fromRGBO(36, 36, 36, 1),
);

final ButtonStyle loginButtonStyle = TextButton.styleFrom(
  minimumSize: const Size(150, 50),
  padding: const EdgeInsets.symmetric(horizontal: 16.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(50.0)),
  ),
  backgroundColor: Colors.white,
  foregroundColor: const Color.fromRGBO(36, 36, 36, 1),
);

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: primaryGreen,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: height / 2,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/images/bg-spiral.png",
                    )),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Text("Banking made beautifully simple",
                      style: TextStyle(
                        fontSize: 45,
                        height: 1.2,
                        fontWeight: FontWeight.w500,
                      )),
                  const SizedBox(height: 20.0),
                  const Text(
                      "A modern design that elevates your banking journey. Manage your finances with flux."),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        style: loginButtonStyle,
                        child: const Text("Log in",
                            style: TextStyle(fontWeight: FontWeight.w300)),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                      ),
                      const SizedBox(width: 20),
                      TextButton(
                        style: registerButtonStyle,
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
      ),
    );
  }
}
