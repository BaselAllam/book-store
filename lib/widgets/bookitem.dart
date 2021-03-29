import 'package:flutter/material.dart';
import 'package:bookapp/models/books/bookcontroller.dart';
import 'package:scoped_model/scoped_model.dart';



class BookItem extends StatefulWidget {

final String image;
final String title;
final String price;
final String id;

BookItem({this.image, this.title, this.price, this.id});

  @override
  _BookItemState createState() => _BookItemState();
}

class _BookItemState extends State<BookItem> {

bool pressed = false;

bool shopping = false;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, BookController books){
        return Container(
          margin: EdgeInsets.all(15.0),
          width: MediaQuery.of(context).size.width/2.4,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 190.0,
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.image,
                    ),
                    fit: BoxFit.fill
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  widget.title,
                  style: TextStyle(color: Colors.black, fontSize: 17.0, fontWeight: FontWeight.bold)
                ),
                subtitle: Text(
                  '4.9 - 20 Reviews\n${widget.price}\$',
                  style: TextStyle(color: Colors.grey, fontSize: 15.0, fontWeight: FontWeight.bold)
                ),
              ),
              Divider(color: Colors.grey, height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(shopping == true ? Icons.shopping_cart : Icons.add_shopping_cart),
                    color: shopping == true ? Colors.black : Colors.grey,
                    iconSize: 20.0,
                    onPressed: () {
                      books.deleteBook(widget.id);
                      setState(() {
                        shopping = !shopping;
                      });
                    }
                  ),
                  IconButton(
                    icon: Icon(pressed == true ? Icons.favorite : Icons.favorite_border),
                    color: pressed == true ? Colors.red : Colors.grey,
                    iconSize: 20.0,
                    onPressed: () {
                      setState(() {
                        pressed = !pressed;
                      });
                    }
                  ),
                ],
              ),
            ],
          ),
        );
      }
    );
  }
}