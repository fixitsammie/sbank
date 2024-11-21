// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:sbank/constants.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({Key? key}) : super(key: key);

  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  @override
  Widget build(BuildContext context) {
    const String fullName = "Ella star";
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hi, $fullName",
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
          Text("Total Balance", style: TextStyle(fontWeight: FontWeight.bold)),
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
                      Icons.add,
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
                      Icons.filter_center_focus,
                      color: Colors.black,
                      size: 15.0,
                    ),
                  ),
                ),
              ],
            )
          ]),
          SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                color: primaryGreen, borderRadius: BorderRadius.circular(20)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 40,
                    child: Image.asset(
                      "images/mastercard-black.png",
                    ),
                  ),
                  Transform.rotate(
                    angle: math.pi / 6,
                    child: IconButton(
                      icon: Icon(
                        Icons.rss_feed,
                        color: Colors.black,
                      ),
                      onPressed: null,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Debit Card",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    color: Colors.brown[50]),
              ),
              Text(
                "1423 2832 8398 8432 ",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(color: Colors.brown[100]),
                  ),
                  Text(
                    "Exp Date",
                    style: TextStyle(color: Colors.brown[100]),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    fullName,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  Text(
                    "06.28",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ],
              ),
            ]),
          ),
          SizedBox(height: 40),
        ],
      ),
    )));
  }
}
