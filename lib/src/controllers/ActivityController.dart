import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plan_app/src/services/api_service.dart';

class WorkOrderDetailController extends GetxController {
  final ApiService _apiService = ApiService();

  var rowItemsDoors = <String>[].obs;
  var rowItemsReported = <String>[].obs;

  @override
  void onReady() {
    // TODO: implement onReady
    getWorkActivity();

    super.onReady();
  }

  void getWorkActivity() async {
    final response = await _apiService.getWithToken('/work-order-activity');

    print(response);

    if (response.statusCode == 200) {
      if (response.data['data'] != null) {
        final List<String> doors = [];
        final List<String> reported = [];

        for (var item in response.data['data']) {
          doors.add(item['data']);
        }

        for (var item in response.data['data']) {
          reported.add(item['data']);
        }

        rowItemsDoors.assignAll(doors);
        rowItemsReported.assignAll(reported);
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