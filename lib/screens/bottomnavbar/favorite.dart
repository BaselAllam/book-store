import 'package:flutter/material.dart';
import 'package:bookapp/widgets/bookitem.dart';



class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {

Map<int, List> data = {
  0 : [
    'Dark Night',
    '200',
    'https://cdn.pastemagazine.com/www/system/images/photo_albums/best-book-covers-july-2019/large/bbcjuly19verynice.jpg?1384968217'
  ],
  1 : [
    'White Dark',
    '300',
    'https://lithub.com/wp-content/uploads/2018/12/educated.jpg',
  ],
  2 : [
    'Blue Night',
    '150',
    'https://www.portersquarebooks.com/sites/portersquarebooks.com/files/thegoldfinch.jpg',
  ],
  3 : [
    'Book Night',
    '250',
    'https://images1.penguinrandomhouse.com/cover/9780399179532'
  ]
};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Favorite',
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
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: data.length,
          itemBuilder: (context, index){
            return BookItem(
              image: data[index][2],
              title: data[index][0],
              price: data[index][1]
            );
          }
        ),
      ),
    );
  }
}