import 'package:acnh_explorer/main.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds: new MyApp(),
      image: new Image.asset('assets/icon.png'),
      backgroundColor: Colors.white,
      photoSize: 100.0,
    );
  }
}