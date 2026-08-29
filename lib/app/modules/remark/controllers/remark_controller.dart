
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class RemarkController extends GetxController {
  final remarkController = TextEditingController();

  void saveRemark() {
    Get.back(result: remarkController.text.trim());
  }

  @override
  void onClose() {
    remarkController.dispose();
    super.onClose();
  }
}

