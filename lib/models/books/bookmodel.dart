


class BookModel{

  String id;
  String bookImage;
  String bookName;
  double bookPrice;

  BookModel(this.bookImage, this.bookName, this.bookPrice, {this.id});


  factory BookModel.fromJson(Map<String, dynamic> i, id){
    return BookModel(
      i['bookImage'],
      i['bookName'],
      i['bookPrice'],
      id: id
    );
  }
}