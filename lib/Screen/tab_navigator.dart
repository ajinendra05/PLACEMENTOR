import 'package:flutter/material.dart';
import 'package:placementor/Screen/homeScreen.dart';
import 'package:placementor/Screen/message_screen.dart';
import 'package:placementor/Screen/notification.dart';

import 'Profile.dart';

class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;
  const TabNavigator(
      {super.key, required this.navigatorKey, required this.tabItem});

  @override
  Widget build(BuildContext context) {
    Widget childd = Home();
    if (tabItem == "page1")
      childd = Home();
    else if (tabItem == "page2")
      childd = NotificationScreen();
    else if (tabItem == "page3")
      childd = Resources();
    else if (tabItem == "page4") childd = MyProfile();
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => childd,
        );
      },
    );
  }
}
