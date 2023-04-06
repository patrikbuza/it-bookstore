import 'package:json_annotation/json_annotation.dart';

part 'book_list.g.dart';

@JsonSerializable()
class BookList {
  String? total;
  String? page;
  List<Book>? books;

  BookList({
    this.total,
    this.page,
    this.books,
  });

  factory BookList.fromJson(Map<String, dynamic> json) => _$BookListFromJson(json);
  Map<String, dynamic> toJson() => _$BookListToJson(this);
}

@JsonSerializable()
class Book {
  String? title;
  String? subtitle;
  String? isbn13;
  String? price;
  String? image;
  String? url;

  Book({
    this.title,
    this.subtitle,
    this.isbn13,
    this.price,
    this.image,
    this.url,
  });

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  Map<String, dynamic> toJson() => _$BookToJson(this);
}
