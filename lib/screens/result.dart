import 'package:flutter/material.dart';
import 'package:bookapp/widgets/bookitem.dart';
import 'package:bookapp/models/books/bookcontroller.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:bookapp/responsive/responsivehomepage.dart';


class Result extends StatefulWidget {

final BookController books;

Result(this.books);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {

  @override
  void initState(){
    widget.books.getBooks();
    super.initState();
  }

String selectedChoice = '';

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Results',
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
          PopupMenuButton(
            icon: Icon(Icons.tune),
            itemBuilder: (BuildContext context){
              return <PopupMenuEntry<String>>[
                PopupMenuItem(
                  child: Text('Price Low To High'),
                  value: 'Price Low To High'
                ),
                PopupMenuItem(
                  child: Text('Price High To Low'),
                  value: 'Price High To Low'
                ),
                PopupMenuItem(
                  child: Text('Rate High To Low'),
                  value: 'Rate High To Low'
                ),
                PopupMenuItem(
                  child: Text('Rate Low To High'),
                  value: 'Price Low To High'
                ),
              ];
            },
            onSelected: (value){
              setState(() {
                selectedChoice = value;
              });
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ScopedModelDescendant(
          builder: (context, child, BookController books){
            if(books.isGetBookLoading == true){
              return Center(child: CircularProgressIndicator());
            }else if(books.allBooks.isEmpty){
              return Center(child: Text('Oops, No Books Found'));
            }else{
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: responsiveResultItem(screenHeight)
                ),
                scrollDirection: Axis.vertical,
                itemCount: books.allBooks.length,
                itemBuilder: (context, index){
                  return BookItem(
                    image: books.allBooks[index].bookImage,
                    title: books.allBooks[index].bookName,
                    price: books.allBooks[index].bookPrice.toString(),
                    id: books.allBooks[index].id,
                  );
                }
              );
            }
          }
        )
      ),
    );
  }
}