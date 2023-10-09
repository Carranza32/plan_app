import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plan_app/src/models/current_workorder_model.dart';
import 'package:plan_app/src/models/workorder_activity_model.dart';
import 'package:plan_app/src/services/api_service.dart';

class WorkOrderDetailController extends GetxController {
  final ApiService _apiService = ApiService();
  Rx<WorkOrderActivityModel> workActivity = WorkOrderActivityModel().obs;

  var rowItemsDoors = <String>[].obs;
  var rowItemsReported = <String>[].obs;

  @override
  void onReady() {
    // TODO: implement onReady
    getWorkActivity();
    getWorkHistoryPregress();

    super.onReady();
  }

  void getWorkActivity() async {
    CurrentWorkOrderModel data = Get.arguments as CurrentWorkOrderModel;

    final response = await _apiService.getWithToken('/work-order-activity/${data.id}?current_project_id=3');

    print(response);

    if (response.statusCode == 200) {
      var data = response.data['data'];

      workActivity.value = WorkOrderActivityModel.fromJson(data);
    } else {
      Get.snackbar(
        'Error',
        'No es posible obtener los supervisores',
        backgroundColor: Colors.black45,
        colorText: Colors.white,
      );
    }
  }

  void getWorkHistoryPregress() async {
    CurrentWorkOrderModel data = Get.arguments as CurrentWorkOrderModel;

    final response = await _apiService.getWithToken('/work-order-activity/${data.id}/progress-history?current_project_id=3');

    print(response);

    if (response.statusCode == 200) {
      var data = response.data['data'];

      workActivity.value = WorkOrderActivityModel.fromJson(data);
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