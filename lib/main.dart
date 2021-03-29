import 'package:flutter/material.dart';
import 'package:bookapp/screens/splashscreen.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:bookapp/models/books/bookcontroller.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: BookController(),
      child: MaterialApp(
        home: SplashScreens(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}