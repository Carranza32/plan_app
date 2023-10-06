import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plan_app/src/constants.dart';
import 'package:plan_app/src/controllers/HomeController.dart';
import 'package:plan_app/src/widgets/drawer_widget.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        endDrawer: const DrawerWidget(),
        appBar: AppBar(
          title: const Text('Bienvenido'),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: const AssetImage('assets/home2.jpg'),
                height: size.height * 0.3,
              ),

              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Seleccione la obra que desea visualizar",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Material(
                borderRadius: BorderRadius.circular(6),
                elevation: 2,
                child: Obx(() => DropdownButtonFormField<String>(
                  value: controller.selectedValue.value,
                  decoration: formFieldStyle(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      controller.selectedValue.value = newValue;
                    }
                  },
                  items: controller.projects.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        child: Text(value),
                      ),
                    );
                  }).toList(),
                )),
              ),
            
              const Spacer(),

              ElevatedButton(
                style: primaryButtonStyle().copyWith(
                  minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 0)),
                  elevation: MaterialStateProperty.all<double>(0),
                ),
                child: const Text("Continuar"),
                onPressed: () {
                  Get.offAllNamed('/commune/dashboard');
                },
              ),

              const Spacer(),
            ],
          ),
        ),
      )
    );
  }
}