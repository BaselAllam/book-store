import 'package:bookapp/screens/bottomnavbar/homepage.dart';
import 'package:flutter/material.dart';
import 'package:bookapp/screens/bottomnavbar/favorite.dart';
import 'package:bookapp/screens/bottomnavbar/profile.dart';



class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

int current = 0;

List screens = [
  HomePage(), Favorite(), Profile()
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favorite'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
        currentIndex: current,
        onTap: (index){
          setState(() {
            current = index;
          });
        },
        elevation: 0.0,
        backgroundColor: Colors.white,
        selectedIconTheme: IconThemeData(color: Colors.black, size: 20.0),
        selectedItemColor: Colors.black,
        unselectedIconTheme: IconThemeData(color: Colors.grey, size: 20.0),
        unselectedItemColor: Colors.grey,
      ),
      body: screens[current],
    );
  }
}