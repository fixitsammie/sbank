// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({Key? key}) : super(key: key);

  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Ella Star",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(
                    "images/ella.jpg",
                  ),
                ),
              ]),
          SizedBox(height: 30),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("\$ 42.00"),
            Wrap(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.audiotrack,
                      color: Colors.black,
                      size: 15.0,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  padding: EdgeInsets.all(10),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.audiotrack,
                      color: Colors.black,
                      size: 15.0,
                    ),
                  ),
                ),
              ],
            )
          ]),
          Card(
            child: Column(children: [
              Row(
                children: [Text("money"), Text("ego")],
              )
            ]),
          )
        ],
      ),
    )));
  }
}
