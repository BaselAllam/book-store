import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

Map<int, List> data = {
  0 : [
    'Email',
    Icons.email
  ],
  1 : [
    'Password',
    Icons.lock
  ],
  2 : [
    'Account',
    Icons.person
  ],
  3 : [
    'Setting',
    Icons.settings
  ]
};



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
            itemCount: data.length,
            itemBuilder: (context, index){
              return ListTile(
                leading: Icon(data[index][1], color: Colors.black, size: 25.0),
                title: Text(
                    data[index][0],
                    style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold)
                  ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 20.0),
              );
            }
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            title('Popular'),
            Container(
              height: MediaQuery.of(context).size.height/2.4,
              child: scrollItem(popularBookData)
            ),
            title('Bestsellers'),
            Container(
              height: MediaQuery.of(context).size.height/2.4,
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
        return Container(
          margin: EdgeInsets.all(15.0),
          width: MediaQuery.of(context).size.width/2.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 190.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    image: NetworkImage(
                      data[index][2]
                    ),
                    fit: BoxFit.fill
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  data[index][0],
                  style: TextStyle(color: Colors.black, fontSize: 17.0, fontWeight: FontWeight.bold)
                ),
                subtitle: Text(
                  '4.9 20 Reviews\n${data[index][1]}\$',
                  style: TextStyle(color: Colors.grey, fontSize: 15.0, fontWeight: FontWeight.bold)
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}