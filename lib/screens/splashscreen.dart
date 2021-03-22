import 'package:bookapp/screens/bottomnavbar/bottomnavbar.dart';
import 'package:bookapp/screens/onboard.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreens extends StatefulWidget {
  @override
  _SplashScreensState createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {

String email;  

checkData() async {
  SharedPreferences _user = await SharedPreferences.getInstance();
  setState(() {
  email =  _user.getString('email');
  });
}

@override
void initState() {
  checkData();
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      navigateAfterSeconds: email == null ? OnBoard() : BottomNavBar(),
      title: Text(
        'Welcome In BookApp',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black),
      ),
      image: Image.network(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8e0ipH4WV25zoCDgqxcOj5BMIB4oXNwpnGgmNFzjMi3iAhFbvirKCTERUDSIqz3FNHRI&usqp=CAU',
        fit: BoxFit.fill,
      ),
      backgroundColor: Colors.white,
      loaderColor: Colors.black,
    );
  }
}