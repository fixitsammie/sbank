import 'package:flutter/material.dart';
import 'constants.dart';

void main() {
  runApp(const MainApp());
}
 final ButtonStyle RegisterButtonStyle = TextButton.styleFrom(
    foregroundColor: Colors.white,
    minimumSize: const Size(88, 44),
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(50.0)),
    ),
    backgroundColor: const Color.fromRGBO(36, 36, 36, 1),
  );

 final ButtonStyle LoginButtonStyle = TextButton.styleFrom(
    
    minimumSize: const Size(88, 44),
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(50.0)),
    ),
   backgroundColor: Colors.white,
    foregroundColor: const Color.fromRGBO(36, 36, 36, 1),
  );
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: primaryGreen,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "images/bg-spiral.png",
                      height: 200,
                    ),
                  ),const Text("Banking made beautifully simple",style:TextStyle(fontSize: 50)), const SizedBox(height: 10.0),
                        const Text("A modern design that elevates your banking journey. Manage your finances with flux."),
     Row(mainAxisAlignment:MainAxisAlignment.center,children: [
            
                          TextButton(
       style: LoginButtonStyle,
          child: const Text("Log in",
              style: TextStyle(fontWeight: FontWeight.w300)),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/register');
          },
        ),
        const SizedBox(width:20),
           TextButton(
       style: RegisterButtonStyle,
          child: const Text("Register",
              style: TextStyle(fontWeight: FontWeight.w300)),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/register');
          },
        ),

          ],),
            const Center(
              child: Text('Hello World!'),
            ),
          ],
        ),
      ),
    );
  }
}
