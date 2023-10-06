import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plan_app/src/services/api_service.dart';

class HomeController extends GetxController {
  final ApiService _apiService = ApiService();
  var selectedValue = 'Valor predeterminado'.obs;
  var projects = <String>[].obs;

  @override
  void onReady() {
    // TODO: implement onReady
    getProjects();
    super.onReady();
  }

  void getProjects() async {
    final response = await _apiService.getWithToken('/project');

    print(response);

    if (response.statusCode == 200) {
      if (response.data['projects'] != null) {
        final List<String> data = [];

        GetStorage().write('projects', response.data['projects']);

        for (var project in response.data['projects']) {
          data.add(project['name']);
        }

        projects.assignAll(data);
      }
    } else {
      Get.snackbar(
        'Error',
        'No es posible obtener los proyectos',
        backgroundColor: Colors.black45,
        colorText: Colors.white,
      );
    }
  }



}