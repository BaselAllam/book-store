import 'package:flutter/material.dart';
import 'package:bookapp/screens/signin.dart';
import 'package:bookapp/screens/signup.dart';
import 'package:bookapp/widgets/socialitem.dart';


class OnBoard extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: MediaQuery.of(context).size.height/2.5,
              margin: EdgeInsets.only(bottom: 5.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://unblast.com/wp-content/uploads/2020/04/Man-Reading-a-Book-Vector-Illustration-1.jpg'),
                  fit: BoxFit.fill
                )
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Hello!',
                style: TextStyle(color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Start Reading your Favorite Books',
                style: TextStyle(color: Colors.grey, fontSize: 15.0, fontWeight: FontWeight.normal),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  button('Login', Colors.white, Colors.black, () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {return SignIn();}));
                  }),
                  button('Signup', Colors.black, Colors.transparent, () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {return SignUp();}));
                  })
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'OR With Social Media',
                style: TextStyle(color: Colors.grey, fontSize: 15.0, fontWeight: FontWeight.normal, height: 2.0),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SocialItem('https://www.freedomforuminstitute.org/wp-content/uploads/2016/10/google-icon.png', () {}),
                  SocialItem('https://upload.wikimedia.org/wikipedia/commons/c/cd/Facebook_logo_%28square%29.png', () {})
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
  button(String title, Color titleColor, Color buttonColor, Function onPressed) {
    return FlatButton(
      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      child: Text(
        '$title',
        style: TextStyle(color: titleColor, fontSize: 20.0, fontWeight: FontWeight.normal),
      ),
      color: buttonColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0), side: BorderSide(color: Colors.black, width: 1.0)),
      onPressed: onPressed,
    );
  }
}