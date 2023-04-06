// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_finder/home/home_controller.dart';

class BookListView extends GetView<HomeController> {
  const BookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 153, 194, 236),
        title: const Text("IT Bookstore"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
          Center(
              child: RichText(
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    style: TextStyle(fontFamily: "OpenSans", color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(text: "Searched text "),
                      TextSpan(
                        text: '"' + controller.searchText + '"',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ))),
          SizedBox(height: 10),
          Expanded(
            child: controller.searchedBooks?.books?.isEmpty == true
                ? Center(child: Text("No match found", style: TextStyle(fontSize: 16)))
                : GetBuilder<HomeController>(
                    builder: (controller) => ListView.builder(
                      controller: controller.scrollController,
                      itemCount: controller.searchedBooks?.books?.length,
                      itemBuilder: (context, index) {
                        final book = controller.searchedBooks!.books![index];
                        return Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  book.image!,
                                  width: 80,
                                  height: 100,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width - 100,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          book.title!,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          book.subtitle!,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(height: 10),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Get.toNamed("/bookInfo", arguments: book.isbn13);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              minimumSize: Size(60, 35),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(50.0),
                                              ),
                                            ),
                                            child: Text("More info"),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider()
                          ],
                        );
                      },
                    ),
                  ),
          ),
          Container(
            height: 40,
            color: Color.fromRGBO(153, 194, 236, 1),
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Obx(() => Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 7,
                        child: Visibility(
                          visible: controller.currentPage.value == 1 ? false : true,
                          child: IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              controller.previousPage();
                            },
                          ),
                        ),
                      ),
                      Text("Page " + controller.currentPage.toString() + " / " + controller.maxP.toString()),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 7,
                        child: Visibility(
                          visible: controller.currentPage.value == controller.maxP.value ? false : true,
                          child: IconButton(
                            icon: Icon(Icons.arrow_forward_ios),
                            onPressed: () async {
                              controller.nextPage();
                            },
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          )
        ]),
      ),
    );
  }
}
