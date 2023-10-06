import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plan_app/src/services/api_service.dart';

class WorkController extends GetxController {
  final ApiService _apiService = ApiService();

  var selectedSupervisor = 'Valor predeterminado'.obs;
  var supervisors = <String>[].obs;

  var selectedprofessionals = 'Valor predeterminado'.obs;
  var professionals = <String>[].obs;

  var workOrders = <String>[].obs;

  @override
  void onReady() {
    // TODO: implement onReady
    getProfessionals();
    getSupervisors();
    getWorkOrders();

    super.onReady();
  }

  void getSupervisors() async {
    final response = await _apiService.getWithToken('/users/supervisors');

    print(response);

    if (response.statusCode == 200) {
      if (response.data['data'] != null) {
        final List<String> data = [];

        for (var project in response.data['data']) {
          data.add(project['data']);
        }

        professionals.assignAll(data);
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

  void getProfessionals() async {
    final response = await _apiService.getWithToken('/users/field-manager');

    print(response);

    if (response.statusCode == 200) {
      if (response.data['data'] != null) {
        final List<String> data = [];

        for (var project in response.data['data']) {
          data.add(project['data']);
        }

        professionals.assignAll(data);
      }
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
    final response = await _apiService.getWithToken('/work-order');

    print(response);

    if (response.statusCode == 200) {
      if (response.data['data'] != null) {
        final List<String> data = [];

        for (var project in response.data['data']) {
          data.add(project['data']);
        }

        professionals.assignAll(data);
      }
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