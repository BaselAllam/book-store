import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

List<String> title = [
  'email', 'password', 'account', 'setting'
];

List<IconData> icons = [
  Icons.email, Icons.lock, Icons.person, Icons.settings
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Book',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black, size: 25.0),
        elevation: 0.0,
        actions: [
          Icon(
            Icons.search,
          ),
        ],
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: icons.length,
            itemBuilder: (context, index){
              return ListTile(
                leading: Icon(icons[index], color: Colors.black, size: 25.0),
                title: Text(
                    title[index],
                    style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold)
                  ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 20.0),
              );
            }
          ),
        ),
      ),
    );
  }
}