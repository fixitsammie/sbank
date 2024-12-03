import 'package:flutter/material.dart';
import 'package:sbank/local_data/transactions.dart';

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
              children: [Text( TRANSACTIONS[index].name,), 
              
              Text(TRANSACTIONS[index].subtitle)]),
        ],
      ),
       Text(TRANSACTIONS[index].amount.toString())
    ]),
  );
}
