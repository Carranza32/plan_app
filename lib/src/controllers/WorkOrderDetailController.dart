import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plan_app/src/services/api_service.dart';

class WorkOrderDetailController extends GetxController {
  final ApiService _apiService = ApiService();

  var workActivities = <String>[].obs;

  @override
  void onReady() {
    // TODO: implement onReady
    getWorkActivities();

    super.onReady();
  }

  void getWorkActivities() async {
    final response = await _apiService.getWithToken('/work-order-activity');

    print(response);

    if (response.statusCode == 200) {
      if (response.data['data'] != null) {
        final List<String> data = [];

        for (var project in response.data['data']) {
          data.add(project['data']);
        }

        workActivities.assignAll(data);
      }
    } else {
      Get.snackbar(
        'Error',
        'No es posible obtener los supervisores',
        backgroundColor: Colors.black45,
        colorText: Colors.white,
      );
    }
  }
}