import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plan_app/src/services/api_service.dart';

class LoginController extends GetxController {
  final ApiService _apiService = ApiService();
  GetStorage storage = GetStorage();

  TextEditingController uidController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool obscureText = true.obs;
  RxBool isLoading = false.obs;

  @override
  void onReady() {
    // TODO: implement onReady
    uidController.text = '17598590-5';
    passwordController.text = '1759';

    checkAuth();
    super.onReady();
  }

  void checkAuth() {
    try {
      var token = storage.read('token');

      if (token != null) {
        print("Ya estas registrado");
        print(token);
        Get.offAllNamed("/home");
      }else{
        print("No estas registrado");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void login() async {
    final response = await _apiService.post('/login', {
      'uid': uidController.text,
      'password': passwordController.text,
    });

    if (response.statusCode == 200) {
      //Guardar token
      storage.write('token', response.data['token']);
      storage.write('projects', response.data['projects']);
      
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