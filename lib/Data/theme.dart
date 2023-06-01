import 'package:flutter/material.dart';
import 'constantData.dart';

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
