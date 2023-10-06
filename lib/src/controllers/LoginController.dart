import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plan_app/src/services/api_service.dart';

class LoginController extends GetxController {
  final ApiService _apiService = ApiService();

  TextEditingController uidController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool obscureText = true.obs;
  RxBool isLoading = false.obs;

  @override
  void onReady() {
    // TODO: implement onReady
    uidController.text = '21317387-1';
    passwordController.text = '123123123';
    super.onReady();
  }

  void login() async {
    final response = await _apiService.post('/login', {
      'uid': uidController.text,
      'password': passwordController.text,
    });

    if (response.statusCode == 200) {
      //Guardar token
      GetStorage().write('token', response.data['token']);
      GetStorage().write('projects', response.data['projects']);
      
      Get.offAllNamed('/home');
    } else {
      Get.snackbar(
        'Error',
        'Credenciales incorrectas',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }



}