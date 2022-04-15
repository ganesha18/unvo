import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Screen/AdminProfile.dart';
import 'Screen/CustomerEditProfile.dart';
import 'Screen/DesignerPage.dart';
import 'Screen/SplashScreen.dart';
import 'Screen/home.dart';
import 'Screen/login.dart';
import 'Screen/registerPage.dart';
import 'details/details_screen.dart';
import 'model/homeui.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
