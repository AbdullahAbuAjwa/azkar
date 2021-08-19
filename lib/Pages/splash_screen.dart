import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:azkar/Pages/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(milliseconds: 2500),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/images/2.png',
              height: 300,
              width: 300,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFFE3FFE6),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      '',
                      textStyle: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: Colors.black),
                    ),
                    TyperAnimatedText(
                      'أذكاري',
                      speed: Duration(milliseconds: 200),
                      textStyle: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: Colors.black),
                    ),
                  ],
                  totalRepeatCount: 1,
                ),
                // child: Text(
                //   'أذكاري',
                //   style: Theme.of(context)
                //       .textTheme
                //       .headline3!
                //       .copyWith(color: Colors.black),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
