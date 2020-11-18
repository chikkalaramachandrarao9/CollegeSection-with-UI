import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yibe_final_ui/pages/PageHandler.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var color = "Orange";

  orangeSplashScreen() {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset("assets/images/White_Logo.svg"),
          SizedBox(
            height: 10,
          ),
          SvgPicture.asset("assets/images/White_Name.svg"),
        ],
      )),
      backgroundColor: Color(0xFFFD8F6E),
    );
  }

  whiteSplashScreen() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSplashScreen(
            duration: 150,
            splash: SvgPicture.asset('assets/images/animation1.svg'),
            nextScreen: AnimatedSplashScreen(
                duration: 150,
                splash:
                    SvgPicture.asset('assets/images/splash_screen_green.svg'),
                nextScreen: PageHandler(),
                splashTransition: SplashTransition.fadeTransition,
                backgroundColor: Colors.white),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: Color(0xff0CB5BB)));
  }
}