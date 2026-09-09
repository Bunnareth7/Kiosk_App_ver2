import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kiosk_app/app/core/results/results.dart';
import 'package:kiosk_app/app/data/providers/api_service.dart';
import 'package:kiosk_app/app/modules/ordering_page/views/ordering_page_view.dart';

class LoginController extends GetxController {
  final ApiService _apiService = Get.find<ApiService>();
  final GetStorage _storage = GetStorage();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var isPasswordVisible = false.obs;

  @override
  void onInit() {
    super.onInit();

    final token = _storage.read('access_token');
    if (token != null && token.toString().isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        OrderingView.open();
      });
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> login() async {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      errorMessage.value = 'Please enter username and password';
      return;
    }

    isLoading.value = true;
    errorMessage.value = '';

    try {
      final result = await _apiService.login(username, password);

      switch (result) {
        case Success():
          final token = result.data['access_token'];
          _storage.write('access_token', token);
          OrderingView.open();
          break;

        case Failure():
          errorMessage.value = result.message.isNotEmpty
              ? result.message
              : 'Invalid credentials';
          break;
      }
    } catch (e) {
      errorMessage.value = 'Something went wrong. Please try again.';
    } finally {
      isLoading.value = false;
    }
  }

  void logout() {
    _storage.remove('access_token');
    _storage.remove('refresh_token');
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}