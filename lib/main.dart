import 'package:flutter/material.dart';
import 'package:bookapp/screens/splashscreen.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreens(),
      debugShowCheckedModeBanner: false,
    );
  }
}