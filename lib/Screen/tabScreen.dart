import 'package:flutter/material.dart';
import 'package:placementor/Screen/tab_navigator.dart';
import 'package:rive/rive.dart';

import '../Data/constantData.dart';
import '../Widgets/riveService.dart';

class AppHomePage extends StatefulWidget {
  const AppHomePage({super.key});

  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  StateMachineController getRiveController(Artboard artboard,
      {stateMachinName = 'State Machine 1'}) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, stateMachinName);
    artboard.addController(controller!);
    return controller;
  }

  late RiveAsset selectedBottomIcon = bottomNavIcon.first;
  String currentpage = "page1";
  int currentIndex = 0;
  List<String> pageKeys = ["page1", "page2", "page3", "page4"];
  Map<String, GlobalKey<NavigatorState>> _navigatorKey = {
    "page1": GlobalKey<NavigatorState>(),
    "page2": GlobalKey<NavigatorState>(),
    "page3": GlobalKey<NavigatorState>(),
    "page4": GlobalKey<NavigatorState>()
  };

  void selectTab(String tabItem, int index) {
    if (tabItem == currentpage) {
      _navigatorKey[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        currentpage = pageKeys[index];
        currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKey[currentpage]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (currentpage != "page1") {
            selectedBottomIcon = bottomNavIcon[0];
            selectTab("page1", 1);
            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        floatingActionButton: Container(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.04, vertical: height * 0.01),
          margin:
              EdgeInsets.only(left: width * 0.1, right: width * 0.1, bottom: 0),
          decoration: BoxDecoration(
              color: kcextra9.withOpacity(0.8),
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              boxShadow: const [
                // BoxShadow(
                //     color: Colors.grey, blurRadius: 25.0, offset: Offset(-8, 8))
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                  bottomNavIcon.length,
                  (index) => GestureDetector(
                        onTap: () {
                          bottomNavIcon[index].input!.change(true);
                          if (bottomNavIcon[index] != selectedBottomIcon) {
                            setState(() {
                              selectedBottomIcon = bottomNavIcon[index];
                              currentpage = pageKeys[index];
                              currentIndex = index;
                            });
                          }
                          Future.delayed(
                            Duration(seconds: 1),
                            () {
                              bottomNavIcon[index].input!.change(false);
                            },
                          );
                        },
                        child: SizedBox(
                          height: bottomNavIcon[index] == selectedBottomIcon
                              ? 36
                              : 32,
                          width: bottomNavIcon[index] == selectedBottomIcon
                              ? 36
                              : 32,
                          child: Opacity(
                            opacity: bottomNavIcon[index] == selectedBottomIcon
                                ? 0.9
                                : 0.5,
                            child: RiveAnimation.asset(
                              bottomNavIcon.first.src,
                              artboard: bottomNavIcon[index].artboart,
                              onInit: (artboard) {
                                StateMachineController controller =
                                    getRiveController(artboard,
                                        stateMachinName: bottomNavIcon[index]
                                            .stateMachineName);

                                bottomNavIcon[index].input =
                                    controller.findSMI("active") as SMIBool;
                              },
                            ),
                          ),
                        ),
                      ))
            ],
          ),
        ),
        body: Stack(
          children: [
            _buildOffstageNavigator("page1"),
            _buildOffstageNavigator("page2"),
            _buildOffstageNavigator("page3"),
            _buildOffstageNavigator("page4")
          ],
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: currentpage != tabItem,
      child:
          TabNavigator(navigatorKey: _navigatorKey[tabItem]!, tabItem: tabItem),
    );
  }
}
