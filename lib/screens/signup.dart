import 'package:bookapp/screens/bottomnavbar/bottomnavbar.dart';
import 'package:bookapp/widgets/socialitem.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';




class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();
TextEditingController adressController = TextEditingController();

GlobalKey<FormState> addressKey = GlobalKey<FormState>();
GlobalKey<FormState> emailKey = GlobalKey<FormState>();
GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
GlobalKey<FormState> confirmPasswordKey = GlobalKey<FormState>();

final _formKey = GlobalKey<FormState>();

bool secured = true;

bool accepted = false;

DateTime selectedDate = DateTime(1990);

Location location = Location(latitude: 30.0444, longitude: 31.2357);

List<Marker> markers = [];

bool isMapLoading = true;

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
                  'Signup',
                  style: TextStyle(color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              ),
              field('Email Address', Icons.email, TextInputType.emailAddress, false, emailController, emailKey),
              field('Password', Icons.lock, TextInputType.text, secured, passwordController, passwordKey),
              field('Confirm Password', Icons.lock, TextInputType.text, secured, confirmPasswordController, confirmPasswordKey),
              field('Address', Icons.location_on, TextInputType.text, false, adressController, addressKey),
              Container(
                margin: EdgeInsets.all(10.0),
                height: 200.0,
                child: isMapLoading == true ?
                Center(child: CircularProgressIndicator()) :
                 buildMap(location.latitude, location.longitude),
              ),
              ListTile(
                title: Text(
                  'Date of Birth',
                  style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '${selectedDate.toString().substring(0, 10)}',
                  style: TextStyle(color: Colors.grey, fontSize: 17.0, fontWeight: FontWeight.normal),
                ),
                onTap: () async {
                  var _selectedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2010),
                    initialDate: DateTime(2010)
                  );
                  setState(() {
                    selectedDate = _selectedDate;
                  });
                }
              ),
              ListTile(
                title: Text(
                  'Terms & Conditions',
                  style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Read Terms & Conditions',
                  style: TextStyle(color: Colors.grey, fontSize: 17.0, fontWeight: FontWeight.normal),
                ),
                trailing: Checkbox(
                  value: accepted,
                  activeColor: Colors.black,
                  checkColor: Colors.white,
                  onChanged: (value){
                    setState(() {
                      accepted = value;
                    });
                  },
                ),
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.white,
                    builder: (BuildContext context){
                      return ListTile(
                        title: Text(
                          'Our Terms & Conditions',
                          style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Read Carefully\n - Privacy Policy\n - Data Privacy\n - Personal Information\n - Payments Gateway',
                          style: TextStyle(color: Colors.grey, fontSize: 17.0, fontWeight: FontWeight.normal),
                        ),
                      );
                    }
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Builder(
                  builder: (BuildContext context){
                    return FlatButton(
                      child: Text(
                        'Signup',
                        style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.normal),
                      ),
                      color: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      onPressed: () {
                        if(!_formKey.currentState.validate()){
                          Scaffold.of(context).showSnackBar(snack('Field Required!'));
                        }else if(passwordController.text != confirmPasswordController.text){
                          Scaffold.of(context).showSnackBar(snack('Password Not Matched!'));
                        }else{
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
        onFieldSubmitted: (value) {
          searchAdress(value);
        },
      ),
    );
  }
  searchAdress(String placeName) async {

    setState(() {
      isMapLoading = true;
    });

    try{
      List<Location> locations = await locationFromAddress(placeName);
      final Marker newMarker = Marker(
        position: LatLng(locations[0].latitude, locations[0].longitude),
        markerId: MarkerId(locations[0].latitude.toString()),
      );
      setState(() {
        location = locations[0];
        markers.add(newMarker);
        isMapLoading = false;
      });
    }catch(e){
      setState(() {
      isMapLoading = true;
    });
      print(e);
    }
  }
  checkMap() async {

    bool _isEnabled = await Geolocator.isLocationServiceEnabled();
    if(_isEnabled == true){
      Position _currentLocation = await Geolocator.getCurrentPosition();
      Location _newLocation = Location(latitude: _currentLocation.latitude, longitude:_currentLocation.longitude);
      setState(() {
        location = _newLocation;
      });
    }
  }
  buildMap(double lat, double lang) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(lat, lang),
        zoom: 12
      ),
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      mapType: MapType.normal,
      markers: Set<Marker>.from(markers)
    );
  }
}