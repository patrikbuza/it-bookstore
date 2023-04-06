import 'package:get/get.dart';
import 'package:library_finder/bookInfo/bookInfo_controller.dart';

class BookInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BookInfoController());
  }
}
