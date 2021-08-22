import 'package:azkar/Pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenView(
        navigateRoute: HomeScreen(),
        duration: 2300,
        imageSize: 150,
        imageSrc: "assets/images/sebha.png",
        text: "أذكاري",
        textType: TextType.ScaleAnimatedText,
        textStyle: TextStyle(
          fontSize: 30.sp,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
