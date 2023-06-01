import 'package:flutter/material.dart';
import 'package:placementor/Screen/introductionS.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Placementor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IntroductionSlider(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('homePage'),
      ),
    );
  }
}
