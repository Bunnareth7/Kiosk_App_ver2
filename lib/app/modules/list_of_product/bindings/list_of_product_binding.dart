import 'package:get/get.dart';

import '../controllers/list_of_product_controller.dart';

class ListOfProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListOfProductController>(
      () => ListOfProductController(),
    );
  }
}
