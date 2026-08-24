import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt currentIndex = 0.obs;
  final RxInt selectedCategory = 0.obs;
  final RxInt cartCount = 1.obs;
  final RxDouble cartTotal = 2.40.obs;
}
