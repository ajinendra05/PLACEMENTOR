import 'package:flutter/material.dart';

import '../Data/constantData.dart';
import '../Widgets/custom_notification.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List newItem = ["liked", "follow"];
  List todayItem = ["follow", "liked", "liked"];

  List oldesItem = ["follow", "follow", "liked", "liked"];
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("New",
                  style: kslabo.copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.w200,
                      color: Colors.black38)),
              const Divider(
                height: 1,
                color: Colors.black26,
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: newItem.length,
                itemBuilder: (context, index) {
                  return CustomFollowNotifcation();
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: Text("Today",
                    style: kslabo.copyWith(
                        fontSize: 30,
                        fontWeight: FontWeight.w200,
                        color: Colors.black38)),
              ),
              const Divider(
                height: 1,
                color: Colors.black26,
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: todayItem.length,
                itemBuilder: (context, index) {
                  return CustomFollowNotifcation();
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: Text("Oldest",
                    style: kslabo.copyWith(
                        fontSize: 30,
                        fontWeight: FontWeight.w200,
                        color: Colors.black38)),
              ),
              const Divider(
                height: 1,
                color: Colors.black26,
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: oldesItem.length,
                itemBuilder: (context, index) {
                  return CustomFollowNotifcation();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
