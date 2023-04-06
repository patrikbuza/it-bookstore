// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookInfo _$BookInfoFromJson(Map<String, dynamic> json) => BookInfo(
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      authors: json['authors'] as String?,
      publisher: json['publisher'] as String?,
      isbn13: json['isbn13'] as String?,
      pages: json['pages'] as String?,
      year: json['year'] as String?,
      rating: json['rating'] as String?,
      desc: json['desc'] as String?,
      price: json['price'] as String?,
      image: json['image'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$BookInfoToJson(BookInfo instance) => <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'authors': instance.authors,
      'publisher': instance.publisher,
      'isbn13': instance.isbn13,
      'pages': instance.pages,
      'year': instance.year,
      'rating': instance.rating,
      'desc': instance.desc,
      'price': instance.price,
      'image': instance.image,
      'url': instance.url,
    };
