import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:bookapp/models/books/bookmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class BookController extends Model{


  bool _isGetBookLoading = false;
  bool get isGetBookLoading => _isGetBookLoading;

  bool _isDeleteBookLoading = false;
  bool get isDeleteBookLoading => _isDeleteBookLoading;

  bool _isAddBookLoading = false;
  bool get isAddBookLoading => _isAddBookLoading;


  List<BookModel> _allBooks = [];
  List<BookModel> get allBooks => _allBooks;


  getBooks() async {

    _isGetBookLoading = true;
    notifyListeners();


    http.Response _response = await http.get('https://book-374c7-default-rtdb.firebaseio.com/books.json');

    var _data = json.decode(_response.body);

    _data.forEach((x, i){
      final BookModel _newBook = BookModel.fromJson(i, x);
        _allBooks.add(_newBook);
    });


    // Firestore.instance.collection('books').getDocuments().then((QuerySnapshot shot) {
    //   shot.documents.forEach((i) {
    //     final BookModel _newBook = BookModel.fromJson(i.data, i.documentID);
    //     _allBooks.add(_newBook);
    //   });
    // });

    _isGetBookLoading = false;
    notifyListeners();
  }



  Future<bool> addBook(String bookName, double bookPrice, String bookImage) async {

    _isAddBookLoading = true;
    notifyListeners();

    Map<String, dynamic> _data = {
      'bookName' : bookName,
      'bookImage' : bookImage,
      'bookPrice' : bookPrice
    };

    http.Response _response = await http.post('https://book-374c7-default-rtdb.firebaseio.com/books.json', body: json.encode(_data));

    if(_response.statusCode == 200){
      _isAddBookLoading = false;
       notifyListeners();
      return true;
    }else{
      _isAddBookLoading = false;
      notifyListeners();
      return false;
    }

    // Firestore.instance.collection('books').add(_data);

    // _isAddBookLoading = false;
    // notifyListeners();
  }


  Future<bool> deleteBook(String id) async {

    _isDeleteBookLoading = true;
    notifyListeners();

    http.Response _response = await http.delete('https://book-374c7-default-rtdb.firebaseio.com/books/-$id.json');

    if(_response.statusCode == 200){
      _allBooks.removeWhere((BookModel book) {
        return book.id == id;
      });
      _isDeleteBookLoading = false;
      notifyListeners();
      return true;
    }else{
      _isDeleteBookLoading = false;
      notifyListeners();
      return false;
    }

  }


}