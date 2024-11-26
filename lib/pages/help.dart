import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Row(
          children: [
            Text("Help center"),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Text('add'))
          ],
        ),
        Row(children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Text('Image'))
            ]),
          ),
          Column(children: [
            Wrap(
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text('Ai'))
              ],
            ),
            Wrap(
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text('Ai'))
              ],
            )
          ])
        ]),
        Row(children: [
          CircleAvatar(child: Text('avi')),
          Column(
            children: [Text("Support center"), Text('How can we help you?')],
          )
        ]),
        Row(children: [
          CircleAvatar(child: Text('avi')),
          Column(
            children: [Text("Support center"), Text('How can we help you?')],
          ),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Text("1"))
        ]),
        Stack(
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
        ),
      ],
    ));
  }
}
