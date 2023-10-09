import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plan_app/src/constants.dart';
import 'package:plan_app/src/controllers/HomeController.dart';
import 'package:plan_app/src/widgets/drawer_widget.dart';

import '../models/project_model.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
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
              child: Obx(() => (controller.projects.isNotEmpty) ? DropdownButtonFormField<ProjectModel>(
                    value: controller.selectedValue.value ?? controller.projects[0],
                    decoration: formFieldStyle(),
                    items: controller.projects.map<DropdownMenuItem<ProjectModel>>((ProjectModel project) {
                      return DropdownMenuItem<ProjectModel>(
                        value: project,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Text(project.name ?? ''),
                        ),
                      );
                    }).toList(),
                    onChanged: (ProjectModel? value) {
                      controller.selectedValue.value = value!;
                    },
                  ) : const Center(child: CircularProgressIndicator())
              ),
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
    );
  }
}