import 'package:flutter/material.dart';

Widget TransactionListItem(BuildContext context, int index) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Wrap(
        children: [
          CircleAvatar(child: Text("WD")),
          SizedBox(width: 20),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text("Name"), Text("Subtitle")]),
        ],
      ),
      Text("400")
    ]),
  );
}
