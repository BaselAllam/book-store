import 'package:flutter/material.dart';
import 'package:bookapp/widgets/socialitem.dart';
import 'package:bookapp/screens/bottomnavbar/bottomnavbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

GlobalKey<FormState> emailKey = GlobalKey<FormState>();
GlobalKey<FormState> passwordKey = GlobalKey<FormState>();

final _formKey = GlobalKey<FormState>();

bool secured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black, size: 20.0),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              ),
              field('Email Address', Icons.email, TextInputType.emailAddress, false, emailController, emailKey),
              field('Password', Icons.lock, TextInputType.text, secured, passwordController, passwordKey),
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    'Forgot Password?!',
                    style: TextStyle(color: Colors.black, fontSize: 17.0, fontWeight: FontWeight.bold, height: 2.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Builder(
                  builder: (BuildContext context){
                    return FlatButton(
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.normal),
                      ),
                      color: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      onPressed: () async {
                        if(!_formKey.currentState.validate()){
                          Scaffold.of(context).showSnackBar(snack('Field Required!'));
                        }else{
                          // SharedPreferences _user = await SharedPreferences.getInstance();
                          // _user.setString('email', emailController.text);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {return BottomNavBar();}));
                        }
                      },
                    );
                  }
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
          ),
        ),
      ),
    );
  }
  snack(String content) {
    return SnackBar(
      backgroundColor: Colors.red,
      content: Text(content),
      duration: Duration(seconds: 3),
    );
  }
  field(String label, IconData icon, TextInputType type, bool secure, TextEditingController controller, Key key) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        key: key,
        validator: (value) {
          if(value.isEmpty){
            return 'this field required!';
          }else{
            return null;
          }
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.black, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.black, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.black, width: 1.0),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.red, width: 1.0),
          ),
          labelText: label,
          labelStyle: TextStyle(color: Colors.black, fontSize: 15.0),
          prefixIcon: Icon(icon, color: Colors.black),
          suffixIcon: label == 'Password' ? IconButton(
            icon: Icon(Icons.remove_red_eye),
            color: Colors.grey,
            iconSize: 15.0,
            onPressed: () {
              setState(() {
                secured = !secured;
              });
            },
          ) : null
        ),
        keyboardType: type,
        textInputAction: TextInputAction.done,
        obscureText: secure,
        controller: controller,
      ),
    );
  }
}