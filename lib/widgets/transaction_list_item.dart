import 'package:flutter/material.dart';
import 'package:sbank/local_data/transactions.dart';

Widget transactionListItem(BuildContext context, int index) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Wrap(
        children: [
          const CircleAvatar(child: Text("WD")),
          const SizedBox(width: 20),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              transactions[index].name,
            ),
            Text(transactions[index].subtitle)
          ]),
        ],
      ),
      Text(transactions[index].amount.toString())
    ]),
  );
}
