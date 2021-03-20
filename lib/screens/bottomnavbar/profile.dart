import 'package:flutter/material.dart';



class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black, size: 25.0),
        elevation: 0.0,
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            item('My Profile', Icons.account_circle),
            item('Settings', Icons.settings),
            item('Logout', Icons.exit_to_app)
          ],
        ),
      ),
    );
  }
  item(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.black, size: 20.0),
      title: Text(
        title,
        style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
      trailing: Icon(Icons.navigate_next, color: Colors.grey, size: 20.0),
    );
  }
}