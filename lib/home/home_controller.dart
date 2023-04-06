import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_finder/api/api_client.dart';
import 'package:library_finder/api/models/book_list.dart';

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();

  BookList? searchedBooks;
  String searchText = '';
  RxBool enableButton = false.obs;
  RxBool loading = false.obs;
  RxInt currentPage = 1.obs;
  RxInt maxP = 0.obs;

  Future<void> loadNewBooks() async {
    await (await getApi()).newBooks();
  }

  void maxPage() {
    int total = int.parse(searchedBooks!.total!);
    maxP.value = (total / 10).ceil();
  }

  void scrollToTop() {
    scrollController.animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  Future<BookList> findBook(String text) async {
    loading(true);
    searchedBooks = (await (await getApi()).searchBook(text, 1));
    maxPage();
    loading(false);
    return searchedBooks!;
  }

  Future<BookList> pageIndex(String text, int page) async {
    loading(true);
    searchedBooks = (await (await getApi()).searchBook(text, page));
    loading(false);
    scrollToTop();
    return searchedBooks!;
  }

  Future<void> nextPage() async {
    if (currentPage.value < maxP.value) {
      currentPage.value++;
      await pageIndex(searchText, currentPage.value);
      update();
    }
  }

  Future<void> previousPage() async {
    if (currentPage.value > 1) {
      currentPage.value--;
      await pageIndex(searchText, currentPage.value);
      update();
    }
  }

  @override
  void dispose() {
    searchController.dispose();
  }
}
