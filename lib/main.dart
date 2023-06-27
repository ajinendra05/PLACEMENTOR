import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:placementor/Screen/introductionS.dart';
import 'package:placementor/Screen/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:placementor/Screen/tabScreen.dart';
import 'package:provider/provider.dart';

import 'backend/firbase_service.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp Fapp = await Firebase.initializeApp();
  setupLocator();
  runApp(const OverlaySupport(
      child: MaterialApp(
    home: MyApp(),
  )));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ReadInternDetails>(
            create: (_) => locator<ReadInternDetails>(),
          ),
          // ChangeNotifierProvider(builder: (_) => locator<ReadInternDetails>()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Placementor',
          theme: ThemeData(
            primarySwatch: Colors.amber,
          ),
          home: const AppHomePage(),
        ));
  }
}
