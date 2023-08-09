import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Inicio'),
            onTap: () {
              Get.toNamed('/commune/dashboard');
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications_none_rounded),
            title: const Text('Alertas'),
            onTap: () {
              Get.toNamed('/commune/dashboard');
            },
          ),
          ListTile(
            leading: const Icon(Icons.content_paste_rounded),
            title: const Text('Ordenes de trabajo'),
            onTap: () {
              Get.toNamed('/commune/otvigente');
            },
          ),
          ListTile(
            leading: const Icon(Icons.history_rounded),
            title: const Text('Histórico OT'),
            onTap: () {
              Get.toNamed('/commune/historic');
            },
          ),
          ListTile(
            leading: const Icon(Icons.change_circle_outlined),
            title: const Text('Cambiar obra'),
            onTap: () {
              Get.toNamed('/home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_outline_rounded),
            title: const Text('Perfil'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}