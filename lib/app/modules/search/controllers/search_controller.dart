import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchItemController extends GetxController {
  final searchController = TextEditingController();

  final searchText = ''.obs;

  @override
  void onInit() {
    super.onInit();

    searchController.addListener(() {
      searchText.value = searchController.text;
    });
  }

  void clearSearch() {
    searchController.clear();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}