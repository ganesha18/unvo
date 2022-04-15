import 'dart:async';

import 'package:flutter/material.dart';
import 'package:unvo/Screen/Home.dart';

import 'Starting_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => starting_screen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 300,
              width: 300,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(150.0)),
              child: Image.asset("assets/logo.jpeg"),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              " UNVO ",
              style: TextStyle(
                fontSize: 50.0, color: Colors.white,
                fontWeight: FontWeight.w300, // light
                fontStyle: FontStyle.italic,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            )
          ],
        ),
      ),
    );
  }
}
