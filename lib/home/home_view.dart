// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_finder/home/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 153, 194, 236),
        title: const Text("IT Bookstore"),
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 25, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "images/logo_storebook.png",
                width: 200,
              ),
              Center(
                child: Text(
                  "Search books by title, author",
                  style: TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.w600, fontSize: 15),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                autofocus: false,
                controller: controller.searchController,
                onChanged: (value) {
                  controller.searchText = value;
                  if (value.length > 2) {
                    controller.enableButton.value = true;
                  } else {
                    controller.enableButton.value = false;
                  }
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.searchController.clear();
                    },
                    icon: Icon(Icons.clear),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 153, 194, 236),
                      width: 1.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 153, 194, 236),
                      width: 1.5,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Obx(() => ElevatedButton(
                    onPressed: () async {
                      if (controller.searchText.length <= 2) {
                        Get.rawSnackbar(
                          boxShadows: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            )
                          ],
                          isDismissible: false,
                          messageText:
                              Center(child: Text("Text must be atleast 3 letters long", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontFamily: 'OpenSans', fontSize: 14))),
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Color(0xFFF00049),
                          borderRadius: 16,
                          margin: EdgeInsets.only(bottom: 20, left: 25, right: 25),
                          duration: Duration(seconds: 2),
                        );
                      } else {
                        controller.currentPage.value = 1;
                        await controller.findBook(controller.searchText);
                        Get.toNamed("/bookList", arguments: controller.searchText);
                      }
                    },
                    child: Text(
                      "Search",
                      style: TextStyle(fontFamily: "OpensSans", fontWeight: FontWeight.w600),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: controller.enableButton.value ? null : Colors.grey,
                      minimumSize: Size(150, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  )),
              SizedBox(
                height: 25,
              ),
              Obx(() => Visibility(
                    visible: controller.loading.value,
                    child: CircularProgressIndicator(),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
