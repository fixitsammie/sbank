// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sbank/pages/user_dashboard.dart';
import 'package:sbank/widgets/transaction_list_item.dart';
import 'dart:math' as math;

import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:sbank/constants.dart';
import 'package:provider/provider.dart';
import '../../providers/auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PanelController _pc = new PanelController();
  final Color bankCardLight = Color(0xFF94c556);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    String? ella = authProvider.user?.email;
    const String fullName = "Ella star";
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );
    return SafeArea(
      child: SlidingUpPanel(
        backdropEnabled: true,
        minHeight: 200,
        maxHeight: 700,
        controller: _pc,
        panel: Container(
          padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
          child: Column(
            children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 5,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ))
                  ]),
              SizedBox(height: 10),
              const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Transactions",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    Icon(Icons.tune,
                        color: Colors.black, size: 25.0, weight: 30),
                  ]),
              ListView.builder(
                padding: EdgeInsets.all(10.0),
                shrinkWrap: true,
                //itemCount: model.length,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return transactionListItem(context, index);
                },
              )
            ],
          ),
        ),
        borderRadius: radius,
        body: Container(
          decoration: BoxDecoration(color: Colors.grey[50]),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Hi, $ella",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const UserDashboard(selectedIndex: 3),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(
                            "assets/images/ella.jpg",
                          ),
                        ),
                      ),
                    ]),
                SizedBox(height: 30),
                Text("Total Balance",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        style: TextStyle(
                            fontFamily: "Satoshi",
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                        TextSpan(text: '\$ 42,012', children: const <TextSpan>[
                          TextSpan(
                            text: '.25',
                            style: TextStyle(color: Color(0xFFcbcbcb)),
                          )
                        ]),
                      ),
                      Wrap(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Color(0xFFf2f2f2),
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
                              color: Color(0xFFf2f2f2),
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
                      color: primaryGreen,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 40,
                              child: Image.asset(
                                "assets/images/mastercard-black.png",
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
                        Text("Debit Card",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                              color: bankCardLight,
                            )),
                        Text(
                          "1423 2832 8398 8432 ",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 24),
                        ),
                        SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Name",
                              style: TextStyle(color: bankCardLight),
                            ),
                            Text(
                              "Exp Date",
                              style: TextStyle(color: bankCardLight),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              fullName,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 20),
                            ),
                            Text(
                              "06.28",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 20),
                            ),
                          ],
                        ),
                      ]),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
