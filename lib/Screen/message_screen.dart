import 'package:flutter/material.dart';

import '../Data/constantData.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
              textWidthBasis: TextWidthBasis.parent,
              'Message',
              style: kpacifco.copyWith(
                  fontWeight: FontWeight.w300,
                  fontSize: MediaQuery.of(context).size.height * 0.025,
                  color: Colors.black)),
          backgroundColor: const Color.fromARGB(255, 242, 152, 84)),
      body: Column(children: []),
    );
  }
}
