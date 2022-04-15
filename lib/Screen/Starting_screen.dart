import 'package:flutter/material.dart';
import 'package:unvo/common/theme_Helper.dart';

import 'Customer_Login.dart';
import 'login.dart';

class starting_screen extends StatefulWidget {
  const starting_screen({Key? key}) : super(key: key);

  @override
  _starting_screenState createState() => _starting_screenState();
}

class _starting_screenState extends State<starting_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      //   appBar: AppBar(),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 350.0),
          child: Center(
              child: Column(
            children: [
              Container(
                decoration: ThemeHelper().buttonBoxDecoration(context),
                child: ElevatedButton(
                  style: ThemeHelper().buttonStyle(),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                    child: Text(
                      'Admin Login'.toUpperCase(),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  onPressed: () {
                    //After successful login we will redirect to profile page. Let's create profile page now
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: ThemeHelper().buttonBoxDecoration(context),
                child: ElevatedButton(
                  style: ThemeHelper().buttonStyle(),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                    child: Text(
                      'Customer Login'.toUpperCase(),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  onPressed: () {
                    //After successful login we will redirect to profile page. Let's create profile page now
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => customer_login_page()));
                  },
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
