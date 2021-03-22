import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class AddBook extends StatefulWidget {
  @override
  _AddBookState createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {

TextEditingController bookNameController = TextEditingController();
TextEditingController bookPriceController = TextEditingController();

GlobalKey<FormState> bookNameKey = GlobalKey<FormState>();
GlobalKey<FormState> bookPriceKey = GlobalKey<FormState>();

final _formKey = GlobalKey<FormState>();

File image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Add Book',
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
        child: Form(
          key: _formKey,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10.0),
                    height: MediaQuery.of(context).size.height/4,
                    width: MediaQuery.of(context).size.width/2,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: image == null ? 
                        NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8e0ipH4WV25zoCDgqxcOj5BMIB4oXNwpnGgmNFzjMi3iAhFbvirKCTERUDSIqz3FNHRI&usqp=CAU') 
                        : FileImage(image),
                        fit: BoxFit.fill
                      ),
                    ),
                    alignment: Alignment.center,
                    child: IconButton(
                      icon: Icon(Icons.add),
                      color: Colors.black,
                      iconSize: 25.0,
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.white,
                          builder: (BuildContext context){
                            return Column(
                              children: <Widget>[
                                ListTile(
                                  title: Text(
                                    'Device Camera',
                                    style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                                  ),
                                  trailing: Icon(Icons.camera, color: Colors.grey, size: 20.0),
                                  onTap: () {
                                    pickImage(ImageSource.camera);
                                  }
                                ),
                                ListTile(
                                  title: Text(
                                    'Device Gallery',
                                    style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                                  ),
                                  trailing: Icon(Icons.photo_album, color: Colors.grey, size: 20.0),
                                  onTap: () {
                                    pickImage(ImageSource.gallery);
                                  }
                                ),
                              ],
                            );
                          }
                        );
                      },
                    ),
                  ),
                ],
              ),
              field('Book Name', TextInputType.text, bookNameController, bookNameKey),
              field('Book Price', TextInputType.number, bookPriceController, bookPriceKey),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Builder(
                      builder: (BuildContext context){
                        return FlatButton(
                          child: Text(
                            'Add Book',
                            style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.normal),
                          ),
                          color: Colors.black,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                          onPressed: () async {
                            if(!_formKey.currentState.validate()){
                              Scaffold.of(context).showSnackBar(snack('Field Required!'));
                            }else{
                              Scaffold.of(context).showSnackBar(snack('Book Added Sucesfully'));
                            }
                          },
                        );
                      }
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      )
    );
  }
  snack(String content) {
    return SnackBar(
      backgroundColor: Colors.red,
      content: Text(content),
      duration: Duration(seconds: 3),
    );
  }
  field(String label, TextInputType type, TextEditingController controller, Key key) {
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
        ),
        keyboardType: type,
        textInputAction: TextInputAction.done,
        controller: controller,
      ),
    );
  }
  pickImage(ImageSource source) async {

    var _image = await ImagePicker.pickImage(source: source);
    setState(() {
      image = _image;
    });
  }
}