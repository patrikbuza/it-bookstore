import 'package:get/get.dart';
import 'package:library_finder/home/home_controller.dart';

class BookListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
