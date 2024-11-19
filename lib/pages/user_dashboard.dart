import 'package:flutter/material.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({ Key? key }) : super(key: key);

  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SingleChildScrollView(child:Column(
          children: [
            Row(children:[
              Text("Name"),
              SizedBox(height:10,width:10,child:Image.asset(
                "images/bg-spiral.png",
              ))
              
            ]),
            SizedBox(height:30),
            Row(children:[
              Text("42.00"),
               SizedBox(height:10,width:10,child:Image.asset(
                "images/bg-spiral.png",
              )),
               SizedBox(height:10,width:10,child:Image.asset(
                "images/bg-spiral.png",
              ))

            ]),

           Card(
                  child: Column(children:[
Row(children: [Text("money"), Text("ego")],)
                  ]),
                )
          ],
        )));
  }
}