import 'package:flutter/material.dart';
import 'package:bookapp/screens/onboard.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnBoard(),
      debugShowCheckedModeBanner: false,
    );
  }
}