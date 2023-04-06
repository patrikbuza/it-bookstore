// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_finder/bookInfo/bookInfo_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class BookInfoView extends GetView<BookInfoController> {
  const BookInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 153, 194, 236),
        title: const Text("IT Bookstore"),
      ),
      body: Obx(
        () => controller.loading.value == true
            ? Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  Center(
                    child: Image.network(
                      controller.detailBook!.image!,
                    ),
                  ),
                  Center(
                    child: Text(
                      controller.detailBook!.title!,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 5),
                  Center(
                      child: Text(
                    controller.detailBook!.subtitle!,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  )),
                  SizedBox(height: 10),
                  Text("Author - " + controller.detailBook!.authors!),
                  SizedBox(height: 5),
                  Text("Publisher - " + controller.detailBook!.publisher!),
                  SizedBox(height: 5),
                  Text("Published - " + controller.detailBook!.year!),
                  SizedBox(height: 5),
                  Text("Pages - " + controller.detailBook!.pages!),
                  SizedBox(height: 5),
                  Text("Rating - " + controller.detailBook!.rating!),
                  SizedBox(height: 5),
                  Text("ISBN-13 - " + controller.detailBook!.isbn13!),
                  SizedBox(height: 5),
                  Text("Description - " + controller.detailBook!.desc!),
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Center(
                      child: SizedBox(
                        width: 150,
                        height: 35,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (await canLaunchUrl(Uri.parse('https://itbook.store/books/${controller.detailBook!.isbn13!}'))) {
                              await launchUrl(Uri.parse('https://itbook.store/books/${controller.detailBook!.isbn13!}'));
                            }
                          },
                          child: Text("Visit web"),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(MediaQuery.of(context).size.width / 2, 35),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
