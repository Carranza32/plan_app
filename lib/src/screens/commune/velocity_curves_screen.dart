import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plan_app/src/constants.dart';
import 'package:plan_app/src/widgets/drawer_widget.dart';

class VelocityCurvesScreen extends StatelessWidget {
  const VelocityCurvesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: const DrawerWidget(),
        appBar: AppBar( 
          title: const Text('Curvas de velocidad'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),

              const Chip(
                label: Text('Ruta crítica: Si', style: TextStyle(color: Colors.white)), 
                backgroundColor: Color(0xffdfc124)
              ),

              const SizedBox(height: 30),
              Text("Actividad", style: TextStyle(color: primaryColor())),
              const SizedBox(height: 10),

              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Color.fromARGB(255, 219, 219, 219), width: 2),
                      ),
                    ),
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text('Puerta'),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: IconButton(
                          onPressed: () => Get.toNamed('/commune/velocity-curves/details'),
                          icon: Icon(Icons.bar_chart_outlined, color: primaryColor()),
                        ),
                      ),
                    ]
                  ),
                  TableRow(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                    ),
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text('Ventana'),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: IconButton(
                          onPressed: () => Get.toNamed('/commune/velocity-curves/details'),
                          icon: Icon(Icons.bar_chart_outlined, color: primaryColor()),
                        ),
                      ),
                    ]
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}