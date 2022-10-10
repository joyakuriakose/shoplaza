import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shoplaza/screens/screenhome.dart';

import '../constants/constants.dart';
void main(){
  runApp(MaterialApp(home: SplashScreen(),));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 3),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ScreenHome())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: CircleAvatar(backgroundColor: kPrimaryColor,
                  child: Icon(Icons.shopping_cart),
                  radius: 50.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: CircularProgressIndicator(
                  backgroundColor: kGreenLightColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
