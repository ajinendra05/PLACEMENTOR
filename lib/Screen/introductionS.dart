import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../Data/constantData.dart';

class IntroductionS extends StatefulWidget {
  const IntroductionS({super.key});

  @override
  State<IntroductionS> createState() => _IntroductionSState();
}

class _IntroductionSState extends State<IntroductionS> {
  final introKey = GlobalKey<IntroductionScreenState>();

  Widget buildImage(String imagePath) {
    return Center(
        child: Image.asset(
      imagePath,
      width: SizeConfig.screenWidth!,
    ));
  }

  DotsDecorator getDotsDecorator() {
    return const DotsDecorator(
      spacing: EdgeInsets.symmetric(horizontal: 2),
      activeColor: Color.fromARGB(255, 237, 236, 236),
      color: Colors.grey,
      activeSize: Size(30, 5),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
      size: Size(10, 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
    );
  }

  PageDecoration getPageDecoration(Color pc) {
    return PageDecoration(
      imagePadding: EdgeInsets.only(top: SizeConfig.screenHeight! * 0.2),
      pageColor: pc,
      bodyPadding: const EdgeInsets.only(top: 8, left: 20, right: 20),
      titlePadding: const EdgeInsets.only(top: 50),
      titleTextStyle:
          kScreenText.copyWith(fontSize: 25, fontWeight: FontWeight.bold),
      bodyTextStyle:
          kScreenText.copyWith(fontSize: 20, fontWeight: FontWeight.w500),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Color> pc = const [
      Color.fromARGB(255, 233, 142, 109),
      Color.fromARGB(255, 255, 0, 108),
      Color.fromARGB(255, 121, 191, 184)
    ];
    SizeConfig(context);
    return Scaffold(
      body: IntroductionScreen(
          onSkip: () {},
          hideBottomOnKeyboard: true,
          key: introKey,
          pages: [
            PageViewModel(
              title: 'WELCOME !!',
              body: 'We Bridges The Gap bBtween T&P Cell And Students',
              image: buildImage("assets/Images/1.png"),
              decoration: getPageDecoration(pc[0]),
            ),
            PageViewModel(
              title: 'By Student For Student',
              body: 'Get Good Placement & Related Stuff',
              image: buildImage("assets/Images/2.png"),
              decoration: getPageDecoration(pc[1]),
            ),
            PageViewModel(
              title: 'Connect with Us: ',
              body: 'We All Here To Love, Learn And Earn',
              image: buildImage("assets/Images/3.png"),
              decoration: getPageDecoration(pc[2]),
            ),
          ],
          onDone: () {},
          scrollPhysics: const ClampingScrollPhysics(),
          showDoneButton: true,
          showNextButton: true,
          showSkipButton: true,
          isBottomSafeArea: true,
          skip: const Text("Skip",
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.amber)),
          next: const Icon(Icons.forward),
          done: const Text("Done",
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.amber)),
          nextStyle: IconButton.styleFrom(foregroundColor: Colors.amber),
          dotsDecorator: getDotsDecorator()),
    );
  }
}
