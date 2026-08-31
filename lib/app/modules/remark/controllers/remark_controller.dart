import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RemarkController extends GetxController {
  final remarkTextController = TextEditingController();

  final remarks = [
    'Need Changes',
    'Soup noodles is packed seperated',
    'Give security Guard',
    'Please take ice out side',
    'Put it on front desk',
    "Serve fresh, I'm here",
    'Need extra Coffee',
    "Don’t call , add TG",
  ];

  final selectedRemarks = <String>[].obs;
  final isOtherSelected = false.obs;

  void toggleRemark(String remark) {
    if (selectedRemarks.contains(remark)) {
      selectedRemarks.remove(remark);
    } else {
      selectedRemarks.add(remark);
    }
  }

  void toggleOther() {
    isOtherSelected.toggle();
  }

  void clearRemarks() {
    selectedRemarks.clear();
    isOtherSelected.value = false;
    remarkTextController.clear();
  }

  void submit() {
    final result = <String>[
      ...selectedRemarks,
    ];

    if (isOtherSelected.value &&
        remarkTextController.text.trim().isNotEmpty) {
      result.add(remarkTextController.text.trim());
    }

    Get.back(
      result: result.join(', '),
    );
  }

  @override
  void onClose() {
    remarkTextController.dispose();
    super.onClose();
  }
}