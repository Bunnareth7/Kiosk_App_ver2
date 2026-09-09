import 'package:get/get.dart';

import 'package:kiosk_app/app/core/results/results.dart';
import 'api_client.dart';

class ApiService extends GetxService {
  late ApiClient _apiClient;

  @override
  void onInit() {
    super.onInit();
    _apiClient = Get.find<ApiClient>();
  }

  // ===== LOGIN =====
  Future<Result<Map<String, dynamic>>> login(
    String username,
    String password,
  ) async {
    try {
      final response = await _apiClient.post('/adm/v1/api/oauth2', {
        'client_id': username,
        'client_secret': password,
        'grant_type': 'client_credentials',
        'scope': 'ticket.display.integration',
      });

      final body = response.data;

      if (response.statusCode == 200) {
        return Success(body);
      }
      return Failure(
        code: body['code'] ?? response.statusCode,
        message: body['error'] ?? body['message'] ?? 'Login failed',
      );
    } catch (e) {
      return Failure(message: e.toString());
    }
  }
}