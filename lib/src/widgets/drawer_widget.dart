import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plan_app/src/controllers/SettingsController.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsController _settingsController = Get.find();
    
    return Drawer(
      child: ListView(
        children: [
          if(_settingsController.selectedRole.value == _settingsController.gerente || _settingsController.selectedRole.value == _settingsController.pjte || _settingsController.selectedRole.value == _settingsController.supervisor)
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Inicio'),
              onTap: () {
                if (_settingsController.selectedRole.value == _settingsController.supervisor) {
                  Get.offNamed('/commune/otvigente/details');
                }else{
                  Get.offNamed('/commune/dashboard');
                }
              },
            ),

          if(_settingsController.selectedRole.value == _settingsController.gerente || _settingsController.selectedRole.value == _settingsController.pjte)
            ListTile(
              leading: const Icon(Icons.notifications_none_rounded),
              title: const Text('Alertas'),
              onTap: () {
                Get.offNamed('/commune/dashboard');
              },
            ),

          if(_settingsController.selectedRole.value == _settingsController.gerente || _settingsController.selectedRole.value == _settingsController.pjte)
            ListTile(
              leading: const Icon(Icons.content_paste_rounded),
              title: const Text('Ordenes de trabajo'),
              onTap: () {
                Get.offNamed('/commune/otvigente');
              },
            ),

          if(_settingsController.selectedRole.value == _settingsController.gerente || _settingsController.selectedRole.value == _settingsController.pjte || _settingsController.selectedRole.value == _settingsController.supervisor)
            ListTile(
              leading: const Icon(Icons.history_rounded),
              title: const Text('Histórico OT'),
              onTap: () {
                Get.offNamed('/commune/historic');
              },
            ),

          if(_settingsController.selectedRole.value == _settingsController.gerente)
            ListTile(
              leading: const Icon(Icons.change_circle_outlined),
              title: const Text('Cambiar obra'),
              onTap: () {
                Get.offNamed('/home');
              },
            ),

          if(_settingsController.selectedRole.value == _settingsController.gerente || _settingsController.selectedRole.value == _settingsController.pjte || _settingsController.selectedRole.value == _settingsController.supervisor)
            ListTile(
              leading: const Icon(Icons.person_outline_rounded),
              title: const Text('Perfil'),
              onTap: () {
                Get.offNamed('/settings');
              },
            ),

          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Cerrar sesión'),
            onTap: () {
              GetStorage().remove('token');
              Get.offAllNamed('/login');
            },
          ),
        ],
      ),
    );
  }

}