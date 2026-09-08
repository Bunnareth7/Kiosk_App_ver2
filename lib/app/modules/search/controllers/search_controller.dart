import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/data/Model/products_model.dart';

class SearchItemController extends GetxController {
  final searchController = TextEditingController();

  final searchText = ''.obs;

  final products = <ProductModel>[].obs;
  final searchResults = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    // Load products when the search page opens
    products.assignAll(sampleProducts);
    searchResults.assignAll(sampleProducts);

    searchController.addListener(() {
      searchText.value = searchController.text;
      searchProducts(searchController.text);
    });
  }

  void searchProducts(String query) {
    final keyword = query.trim().toLowerCase();

    // Show all products when search is empty
    if (keyword.isEmpty) {
      searchResults.assignAll(products);
      return;
    }

    // Filter products by name
    searchResults.assignAll(
      products.where(
        (product) => product.name.toLowerCase().contains(keyword),
      ),
    );
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