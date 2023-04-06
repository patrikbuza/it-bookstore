import 'package:json_annotation/json_annotation.dart';

part 'book_info.g.dart';

@JsonSerializable()
class BookInfo {
  String? title;
  String? subtitle;
  String? authors;
  String? publisher;
  String? isbn13;
  String? pages;
  String? year;
  String? rating;
  String? desc;
  String? price;
  String? image;
  String? url;

  BookInfo({
    this.title,
    this.subtitle,
    this.authors,
    this.publisher,
    this.isbn13,
    this.pages,
    this.year,
    this.rating,
    this.desc,
    this.price,
    this.image,
    this.url,
  });

  factory BookInfo.fromJson(Map<String, dynamic> json) => _$BookInfoFromJson(json);
  Map<String, dynamic> toJson() => _$BookInfoToJson(this);
}
