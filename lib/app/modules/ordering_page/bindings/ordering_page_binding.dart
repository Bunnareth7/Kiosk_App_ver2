import 'package:get/get.dart';

import '../controllers/ordering_page_controller.dart';

class OrderingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderingPageController>(
      () => OrderingPageController(),
    );
  }
}
