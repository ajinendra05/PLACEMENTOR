import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//SCREEN SIZE
class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  SizeConfig(BuildContext ctx) {
    _mediaQueryData = MediaQuery.of(ctx);
    screenHeight = _mediaQueryData!.size.height;
    screenWidth = _mediaQueryData!.size.width;
    blockSizeHorizontal = screenWidth! / 100;
    blockSizeVertical = screenHeight! / 100;
  }
}

TextStyle kScreenText = GoogleFonts.nunito(
  color: Colors.white,
  fontSize: 35.0,
  fontWeight: FontWeight.bold,
);

// TextStyle kUserName = GoogleFonts.pacifico(
//   color: Colors.black,
//   fontSize: 20,
//   // fontWeight: FontWeight.bold,
// );
// TextStyle kTabBar = GoogleFonts.gothicA1(
//   color: Colors.black,
//   fontSize: 12,
//   fontWeight: FontWeight.bold,
// );
