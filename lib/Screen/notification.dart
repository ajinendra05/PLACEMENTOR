import 'package:flutter/material.dart';

import '../Data/constantData.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
              textWidthBasis: TextWidthBasis.parent,
              'Notification',
              style: kpacifco.copyWith(
                  fontWeight: FontWeight.w300,
                  fontSize: MediaQuery.of(context).size.height * 0.025,
                  color: Colors.black)),
          backgroundColor: const Color.fromARGB(255, 242, 152, 84)),
      body: Column(children: []),
    );
  }
}
