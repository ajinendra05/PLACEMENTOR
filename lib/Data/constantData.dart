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

Color kcprimary = const Color.fromARGB(255, 233, 152, 0);
Color kcsecondry = const Color.fromARGB(255, 206, 74, 67);
Color kcextra1 = const Color.fromARGB(255, 245, 108, 97);
Color kcextra2 = const Color.fromARGB(255, 168, 38, 39);
Color kcextra5 = const Color.fromARGB(255, 67, 2, 0);
Color kcextra3 = const Color.fromARGB(255, 77, 17, 0);
Color kcextra4 = const Color.fromARGB(255, 0, 110, 96);
Color kcextra8 = Color.fromARGB(255, 233, 142, 109);
Color kcextra6 = Color.fromARGB(255, 255, 0, 108);
Color kcextra7 = Color.fromARGB(255, 121, 191, 184);

TextStyle kslabo = GoogleFonts.slabo27px(
  color: Colors.white,
  fontSize: 35.0,
  fontWeight: FontWeight.bold,
);
TextStyle kLora = GoogleFonts.lora(
  color: Colors.white,
  fontSize: 35.0,
  fontWeight: FontWeight.bold,
);
TextStyle kNunitoSans = GoogleFonts.nunitoSans(
  color: Colors.white,
  fontSize: 35.0,
  fontWeight: FontWeight.bold,
);
TextStyle kGaramond = GoogleFonts.ebGaramond(
  color: Colors.white,
  fontSize: 35.0,
  fontWeight: FontWeight.bold,
);
TextStyle kPtSerif = GoogleFonts.ptSerif(
  color: Colors.white,
  fontSize: 35.0,
  fontWeight: FontWeight.bold,
);
TextStyle kEczar = GoogleFonts.eczar(
  color: Colors.white,
  fontSize: 35.0,
  fontWeight: FontWeight.bold,
);
TextStyle kcormant = GoogleFonts.cormorant(
  color: Colors.white,
  fontSize: 35.0,
  fontWeight: FontWeight.bold,
);

TextStyle kScreenText = GoogleFonts.nunito(
  color: Colors.white,
  fontSize: 35.0,
  fontWeight: FontWeight.bold,
);

final lightTheme = ThemeData(
    scaffoldBackgroundColor: Color.fromARGB(255, 237, 236, 236),
    primaryColor: const Color.fromARGB(255, 233, 152, 0),
    cardColor: Color.fromARGB(255, 255, 255, 255),
    textTheme: TextTheme(
      headlineMedium: kLora,
      titleLarge: kGaramond,
      bodyLarge: kslabo,
    ),
    snackBarTheme: SnackBarThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    appBarTheme: AppBarTheme(
        titleTextStyle: kcormant.copyWith(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    )));

final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: const ColorScheme.dark(),
    cardColor: const Color.fromARGB(255, 74, 73, 73),
    textTheme: const TextTheme(
        titleLarge: TextStyle(color: Color.fromARGB(255, 243, 242, 242))),
    primaryColor: Color.fromARGB(255, 5, 31, 51),
    snackBarTheme: SnackBarThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    appBarTheme: AppBarTheme(
        titleTextStyle: kcormant.copyWith(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    )));



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
