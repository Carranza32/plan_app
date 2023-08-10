import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plan_app/src/controllers/SettingsController.dart';
import 'package:plan_app/src/widgets/drawer_widget.dart';

class SettingsScreen extends StatelessWidget {
  final SettingsController _settingsController = Get.find();

  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const DrawerWidget(),
      appBar: AppBar( 
        title: const Text('Configuraciones'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Selecciona un rol:'),
            Obx(
              () => DropdownButton<String>(
                value: _settingsController.selectedRole.value,
                onChanged: (newValue) {
                  _settingsController.updateSelectedRole(newValue!);
                },
                items: _settingsController.roles
                    .map<DropdownMenuItem<String>>(
                      (value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
