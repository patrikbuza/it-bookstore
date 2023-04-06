// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookList _$BookListFromJson(Map<String, dynamic> json) => BookList(
      total: json['total'] as String?,
      page: json['page'] as String?,
      books: (json['books'] as List<dynamic>?)
          ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookListToJson(BookList instance) => <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'books': instance.books,
    };

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      isbn13: json['isbn13'] as String?,
      price: json['price'] as String?,
      image: json['image'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'isbn13': instance.isbn13,
      'price': instance.price,
      'image': instance.image,
      'url': instance.url,
    };
