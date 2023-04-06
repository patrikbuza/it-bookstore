import 'package:get/get.dart';
import 'package:library_finder/api/models/book_info.dart';
import 'package:library_finder/api/api_client.dart';

class BookInfoController extends GetxController {
  final isbn13 = Get.arguments;
  RxBool loading = false.obs;
  BookInfo? detailBook;

  Future<BookInfo> infoBook(String isbn13) async {
    detailBook = (await (await getApi()).infoBook(isbn13));
    return detailBook!;
  }

  @override
  void onInit() async {
    super.onInit;
    loading(true);
    await infoBook(isbn13);
    loading(false);
  }
}
