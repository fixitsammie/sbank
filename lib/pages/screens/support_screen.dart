import 'package:flutter/material.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text("Support center"),
            Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: const Text('add'))
          ],
        ),
        Row(children: [
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(children: [
              Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: const Text('Image'))
            ]),
          ),
          Column(children: [
            Wrap(
              children: [
                Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: const Text('Ai'))
              ],
            ),
            Wrap(
              children: [
                Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: const Text('Ai'))
              ],
            )
          ])
        ]),
        const Row(children: [
          CircleAvatar(child: Text('avi')),
          Column(
            children: [Text("Support center"), Text('How can we Support you?')],
          )
        ]),
        Row(children: [
          const CircleAvatar(child: Text('avi')),
          const Column(
            children: [Text("Support center"), Text('How can we Support you?')],
          ),
          Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: const Text("1"))
        ]),
        Stack(
          children: <Widget>[
            Container(
              height: 400,
              color: Colors.black,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20), // Bottom left corner
                  bottomRight: Radius.circular(20),
                ),
              ),
              height: 320,
            ),
          ],
        ),
      ],
    );
  }
}
