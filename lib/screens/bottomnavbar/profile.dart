import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bookapp/screens/addbook.dart';


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
            item('My Profile', Icons.account_circle, () {}),
            item('Add Book', Icons.add, () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {return AddBook();}));
            }),
            item('Settings', Icons.settings, () {}),
            item('Logout', Icons.exit_to_app, () async {
              SharedPreferences _user = await SharedPreferences.getInstance();
              _user.clear();
            })
          ],
        ),
      ),
    );
  }
  item(String title, IconData icon, Function onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.black, size: 20.0),
      title: Text(
        title,
        style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
      trailing: Icon(Icons.navigate_next, color: Colors.grey, size: 20.0),
      onTap: onTap
    );
  }
}