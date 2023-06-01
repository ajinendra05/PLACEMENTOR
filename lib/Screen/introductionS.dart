import 'dart:async';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:placementor/Data/constantData.dart';

class IntroductionSlider extends StatefulWidget {
  const IntroductionSlider({super.key});
  @override
  _IntroductionSliderState createState() => _IntroductionSliderState();
}

class _IntroductionSliderState extends State<IntroductionSlider> {
  int? _currentPage;
  List visited = List.filled(3, 0);
  final PageController _pageController = PageController(initialPage: 0);
  Timer? _timer;
  final keyIsFirstLoaded = 'is_first_loaded';

  @override
  void initState() {
    super.initState();

    _currentPage = 0;
    _timer = Timer.periodic(const Duration(milliseconds: 1800), (Timer timer) {
      if (_currentPage! < 2) {
        _currentPage = _currentPage! + 1;
      }
      if (visited[_currentPage!] == 0) {
        _pageController.animateToPage(
          _currentPage!,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer!.cancel();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      if (visited[index] == 1) {
        _currentPage = index;
      } else {
        _currentPage = index;
        visited[index] = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: kcextra10,
          child: Padding(
            padding: EdgeInsets.all(width / 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  '\nWelcome to ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: const Color.fromARGB(255, 203, 203, 203),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w500,
                      fontSize: height / 45),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 9.0),
                  child: Text(
                    'PLACEMENTOR',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: const Color.fromARGB(255, 64, 46, 50),
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w900,
                        fontSize: height / 26),
                  ),
                ),
                Expanded(
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: <Widget>[
                      PageView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: _pageController,
                        onPageChanged: _onPageChanged,
                        itemCount: slideList.length,
                        itemBuilder: (context, i) => SlideItem(i),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                        height: height * 0.07,
                        width: width * 0.73,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 64, 46, 50),
                            borderRadius:
                                BorderRadius.all(Radius.circular(width / 50))),
                        child: TextButton(
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => LogIn()));
                          },
                          style: ButtonStyle(
                            padding:
                                MaterialStateProperty.resolveWith<EdgeInsets>(
                                    (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return EdgeInsets.all(width / 30);
                              }
                              return EdgeInsets
                                  .zero; // Use the component's default.
                            }),
                            shape: MaterialStateProperty.resolveWith<
                                OutlinedBorder>((Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(width / 50));
                              }
                              return const RoundedRectangleBorder(); // Use the component's default.
                            }),
                          ),
                          child: Text(
                            'CONTINUE',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Manrope',
                                fontSize: height / 50),
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SlideItem extends StatelessWidget {
  final int index;
  const SlideItem(this.index, {super.key});
  @override
  Widget build(BuildContext context) {
    double temp = index.toDouble();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
              top: height * 0.1, left: width / 30, right: width / 30),
          child: Center(
              child: Image.asset(slideList[index].imageUrl,
                  width: width, height: height * 0.3, fit: BoxFit.fitHeight)),
        ),
        Container(
          margin: EdgeInsets.only(top: height * 0.05),
          child: DotsIndicator(
            dotsCount: slideList.length,
            position: temp,
            decorator:
                DotsDecorator(activeColor: kcextra4, color: Colors.grey[300]!),
          ),
        ),
        // Padding(
        //   padding: EdgeInsets.symmetric(
        //       vertical: height / 40, horizontal: width / 9),
        //   child: Container(
        //     child: Text(slideList[index].title,
        //         style: TextStyle(
        //             color: const Color(0xff082649),
        //             fontWeight: FontWeight.w700,
        //             fontFamily: 'Manrope',
        //             fontSize: height / 38.5),
        //         textAlign: TextAlign.center),
        //   ),
        // ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 15, vertical: height * 0.03),
          child: Text(
            slideList[index].description,
            style: TextStyle(
                color: const Color.fromRGBO(246, 245, 245, 0.641),
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w500,
                fontSize: height / 51),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}

class Slide {
  final String imageUrl;
  final String title;
  final String description;

  Slide({
    required this.imageUrl,
    required this.title,
    required this.description,
  });
}

final slideList = [
  Slide(
    imageUrl: 'assets/Images/1.png',
    title: 'Schedule a Pick up',
    description: 'We Bridges The Gap Between T&P Cell And Students',
  ),
  Slide(
    imageUrl: 'assets/Images/2.png',
    title: 'Segregate and Hand Over',
    description: 'Get Good Placement & Related Stuff',
  ),
  Slide(
    imageUrl: 'assets/Images/3.png',
    title: 'Cash in!',
    description: 'Connect With Us: \n We All Here To Love, Learn And Earn',
  ),
  // Slide(
  //   imageUrl: 'assets/Images/1.png',
  //   title: 'Save the  environment',
  //   description:
  //       'Your initiative to consciously segregate and dispose scrap will help the world have a better tomorrow',
  // ),
];
