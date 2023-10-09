import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plan_app/src/models/current_workorder_model.dart';
import 'package:plan_app/src/models/user_model.dart';
import 'package:plan_app/src/services/api_service.dart';

class WorkController extends GetxController {
  final ApiService _apiService = ApiService();

  Rx<UserModel> selectedSupervisor = UserModel().obs;
  RxList<UserModel> supervisors = <UserModel>[].obs;

  Rx<UserModel> selectedprofessionals = UserModel().obs;
  RxList<UserModel> professionals = <UserModel>[].obs;

  Rx<CurrentWorkOrderModel> workOrder = CurrentWorkOrderModel().obs;

  @override
  void onReady() {
    getProfessionals();
    getSupervisors();
    getWorkOrders();

    super.onReady();
  }

  void getSupervisors() async {
    final response = await _apiService.getWithToken('/users/supervisors?current_project_id=3');

    if (response.statusCode == 200) {
      supervisors.value = response.data['data'].map<UserModel>((item) => UserModel.fromJson(item)).toList();

      selectedSupervisor.value = supervisors[0];
    } else {
      Get.snackbar(
        'Error',
        'No es posible obtener los supervisores',
        backgroundColor: Colors.black45,
        colorText: Colors.white,
      );
    }
  }

  void getProfessionals() async {
    final response = await _apiService.getWithToken('/users/field-manager?current_project_id=3');

    if (response.statusCode == 200) {
      professionals.value = response.data['data'].map<UserModel>((item) => UserModel.fromJson(item)).toList();

      selectedprofessionals.value = professionals[0];
    } else {
      Get.snackbar(
        'Error',
        'No es posible obtener los profesionales',
        backgroundColor: Colors.black45,
        colorText: Colors.white,
      );
    }
  }

  void getWorkOrders() async {
    final response = await _apiService.getWithToken('/work-order/current?current_project_id=3');

    print(response.data);

    if (response.statusCode == 200) {
      var data = response.data['data'];

      workOrder.value = CurrentWorkOrderModel.fromJson(data);
    } else {
      Get.snackbar(
        'Error',
        'No es posible obtener las ordenes de trabajo',
        backgroundColor: Colors.black45,
        colorText: Colors.white,
      );
    }
  }
}