import 'package:flutter/material.dart';
import 'package:bookapp/widgets/bookitem.dart';
import 'package:bookapp/screens/result.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


Map<int, List> popularBookData = {
  0 : [
    'Dark Night',
    '200',
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/action-thriller-book-cover-design-template-3675ae3e3ac7ee095fc793ab61b812cc_screen.jpg?ts=1588152105'
  ],
  1 : [
    'White Dark',
    '300',
    'https://www.booktopia.com.au/blog/wp-content/uploads/2018/12/the-arsonist.jpg',
  ],
  2 : [
    'Blue Night',
    '150',
    'https://i.pinimg.com/474x/8e/b9/63/8eb963b5794dd3f9aeb7cf19a59e659f.jpg',
  ],
  3 : [
    'Book Night',
    '250',
    'https://lithub.com/wp-content/uploads/2019/01/81SBy9jbbHL.jpg'
  ]
};


Map<int, List> bookData = {
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
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {return Result();}));
              //Navigator.pushNamed(context, 'result');
            },
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            title('Popular'),
            Container(
              height: MediaQuery.of(context).size.height/2.1,
              child: scrollItem(popularBookData)
            ),
            title('Bestsellers'),
            Container(
              height: MediaQuery.of(context).size.height/2.1,
              child: scrollItem(bookData),
            ),
          ],
        ),
      ),
    );
  }
  title(String title) {
    return Text(
      title,
      style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold)
    );
  }
  scrollItem(Map<int, List> data) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: data.length,
      itemBuilder: (context, index){
        return BookItem(
          image: data[index][2],
          title: data[index][0],
          price: data[index][1]
        );
      }
    );
  }
}



