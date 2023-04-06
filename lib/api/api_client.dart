import 'dart:io';

import 'package:dio/dio.dart';
import 'package:library_finder/api/models/book_list.dart';
import 'package:library_finder/api/models/book_info.dart';
import 'package:retrofit/retrofit.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';
//flutter pub run build_runner build

@RestApi(baseUrl: 'https://api.itbook.store/1.0/')
abstract class ApiClient {
  static const String jsonContent = "Content-Type: application/json";

  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("new")
  Future<String> newBooks();

  @GET("search/{query}/{page}")
  Future<BookList> searchBook(@Path() String query, @Path() int page);

  @GET("books/{isbn13}")
  Future<BookInfo> infoBook(@Path() String isbn13);
}

Future<ApiClient> getApi() async {
  final dio = Dio(
    BaseOptions(
      receiveTimeout: const Duration(milliseconds: 25000),
      connectTimeout: const Duration(milliseconds: 25000),
    ),
  );
  return ApiClient(dio);
}
