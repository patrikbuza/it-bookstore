import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:library_finder/bookInfo/bookInfo_binding.dart';
import 'package:library_finder/bookInfo/bookInfo_view.dart';
import 'package:library_finder/bookList/bookList_binding.dart';
import 'package:library_finder/bookList/bookList_view.dart';
import 'package:library_finder/home/home_binding.dart';
import 'package:library_finder/home/home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      getPages: [
        GetPage(
          name: "/home",
          page: () => const HomeView(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: "/bookList",
          page: () => const BookListView(),
          binding: BookListBinding(),
        ),
        GetPage(
          name: "/bookInfo",
          page: () => const BookInfoView(),
          binding: BookInfoBinding(),
        ),
      ],
    );
  }
}
