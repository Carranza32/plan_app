import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plan_app/src/models/project_model.dart';
import 'package:plan_app/src/services/api_service.dart';

class HomeController extends GetxController {
  final ApiService _apiService = ApiService();
  Rx<ProjectModel> selectedValue = ProjectModel().obs;
  RxList<ProjectModel> projects = <ProjectModel>[].obs;

  @override
  void onReady() {
    // TODO: implement onReady
    getProjects();
    super.onReady();
  }

  void getProjects() async {
    final response = await _apiService.getWithToken('/project?current_project_id=3');

    if (response.statusCode == 200) {
      GetStorage().write('projects', response.data['data']);

      projects.value = response.data['data'].map<ProjectModel>((project) => ProjectModel.fromJson(project)).toList();

      selectedValue.value = projects[0];

      GetStorage().write('current_project_id', selectedValue.value);
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