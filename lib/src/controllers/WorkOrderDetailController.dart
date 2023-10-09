import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plan_app/src/models/current_workorder_model.dart';
import 'package:plan_app/src/models/workorder_activity_model.dart';
import 'package:plan_app/src/services/api_service.dart';

class WorkOrderDetailController extends GetxController {
  final ApiService _apiService = ApiService();
  Rx<WorkOrderActivityModel> workActivity = WorkOrderActivityModel().obs;

  @override
  void onReady() {
    // TODO: implement onReady\

    super.onReady();
  }
}