import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plan_app/src/constants.dart';
import 'package:plan_app/src/controllers/SettingsController.dart';
import 'package:plan_app/src/widgets/drawer_widget.dart';

class OTVigenteScreen extends StatelessWidget {
  const OTVigenteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(color: Colors.white);
    final SettingsController _settingsController = Get.find();

    return SafeArea(
      child: Scaffold(
        endDrawer: const DrawerWidget(),
        appBar: AppBar( 
          title: const Text('Puente Algarrobo'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text('OT Vigente', style: titleStyle()),
              const SizedBox(height: 20),

              if(_settingsController.selectedRole.value == _settingsController.gerente) _buildGerenteField(),


              const SizedBox(height: 30),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Supervisor",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Material(
                borderRadius: BorderRadius.circular(6),
                elevation: 2,
                child: DropdownButtonFormField(
                  decoration: formFieldStyle(),
                  onChanged: (value) {
                    print(value);
                  },
                  items: const [
                    DropdownMenuItem(
                      value: 1,
                      child: Text("Pedro Rodriguez 1"),
                    ),
                    DropdownMenuItem(
                      value: 2,
                      child: Text("Pedro Rodriguez 2"),
                    ),
                    DropdownMenuItem(
                      value: 3,
                      child: Text("Pedro Rodriguez 3"),
                    ),
                  ],
                )
              ),

              const SizedBox(height: 30),

              
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: primaryColor(),
                    ),
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Text('OT', textAlign: TextAlign.center, style: style),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Text('Inicio', textAlign: TextAlign.center, style: style),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Text('Nuevo aporte al avance en OT', textAlign: TextAlign.center, style: style),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Text('', textAlign: TextAlign.center, style: style),
                      ),
                    ]
                  ),
                  TableRow(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text('OT 13', textAlign: TextAlign.center),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text('17/07/2023', textAlign: TextAlign.center),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text('1,9%', textAlign: TextAlign.center),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: IconButton(
                          onPressed: () => Get.toNamed('/commune/otvigente/details'),
                          icon: Icon(Icons.remove_red_eye_outlined, color: Colors.grey[700]),
                        ),
                      ),
                    ]
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }

  Widget _buildGerenteField(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Profesional jefe de terreno",
          style: TextStyle(
            fontSize: 18,
          ),
        ),

        const SizedBox(height: 20),
        Material(
          borderRadius: BorderRadius.circular(6),
          elevation: 2,
          child: DropdownButtonFormField(
            decoration: formFieldStyle(),
            onChanged: (value) {
              print(value);
            },
            items: const [
              DropdownMenuItem(
                value: 1,
                child: Text("Pedro Rodriguez 1"),
              ),
              DropdownMenuItem(
                value: 2,
                child: Text("Pedro Rodriguez 2"),
              ),
              DropdownMenuItem(
                value: 3,
                child: Text("Pedro Rodriguez 3"),
              ),
            ],
          )
        )
      ],
    );
  }
}