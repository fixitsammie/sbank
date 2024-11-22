import 'package:flutter/material.dart';

class Network extends StatelessWidget {
  const Network({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          height: 400,
          color: Colors.black,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20), // Bottom left corner
              bottomRight: Radius.circular(20),
            ),
          ),
          height: 320,
        ),
      ],
    ));
  }
}
