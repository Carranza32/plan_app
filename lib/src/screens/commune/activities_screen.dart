import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plan_app/src/constants.dart';
import 'package:plan_app/src/controllers/SettingsController.dart';
import 'package:plan_app/src/widgets/drawer_widget.dart';
import 'package:plan_app/src/widgets/generate_table_widget.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsController _settingsController = Get.find();
    
    final rowItemsDoors = [
      ['Ruta Crítica', 'SI'],
      ['Cantidad diaria requerida en OT', '28 uni'],
      ['Unidad', 'UNI'],
      ['Duración actividad en OT', '14 días'],
      ['Cantidad requerida en periodo OT', '392 uni'],
      ['Aporte al avance en OT', '0,9%'],
      ['Fecha inicio actividad en programa maestro', '01/06/2023'],
      ['Fecha término actividad en programa maestro', '31/08/2023'],
    ];

    final rowItemsReported = [
      ['Lu', '01-06-2023', '100'],
      ['Ma', '02-06-2023', '100'],
    ];

    final header = ['Día', 'Fecha', 'Cantidad'];

    return SafeArea(
      child: Scaffold(
        endDrawer: const DrawerWidget(),
        appBar: AppBar( 
          title: const Text('Puente Algarrobo'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Actividad', style: titleStyle()),
              const SizedBox(height: 30),

              const SizedBox(height: 30),
              Text("Puertas", style: TextStyle(color: primaryColor())),
              const SizedBox(height: 10),

              GenerateTableWidget(rows: rowItemsDoors),

              const SizedBox(height: 30),
              Text('Avance reportado', style: titleStyle()),
              
              const SizedBox(height: 10),
              GenerateTableWidget(rows: rowItemsReported, header: header),

              if (_settingsController.selectedRole.value == _settingsController.supervisor || _settingsController.selectedRole.value == _settingsController.pjte) _reportActivitySup(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _reportActivitySup(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),

        Text("Reportar avance", style: titleStyle()),
        const SizedBox(height: 10),
        const Text("Reporte el avance diario de la actividad selecionada"),

        const SizedBox(height: 30),

        const Text("Fecha", style: TextStyle(
          fontSize: 18,
        )),

        const SizedBox(height: 20),
        Material(
          borderRadius: BorderRadius.circular(6),
          elevation: 2,
          child: TextFormField(
            decoration: formFieldStyle().copyWith(
              suffixIcon: const Icon(Icons.calendar_today),
            ),
            onTap: () async {
              DateTime? date = await showDatePicker(
                context: Get.context!,
                initialDate: DateTime.now(),
                firstDate: DateTime(2021),
                lastDate: DateTime(2022),
              );
            },
          ),
        ),

        const SizedBox(height: 30),

        const Text("Cantidad", style: TextStyle(
          fontSize: 18,
        )),

        const SizedBox(height: 20),
        Material(
          borderRadius: BorderRadius.circular(6),
          elevation: 2,
          child: TextFormField(
            decoration: formFieldStyle().copyWith(
              hintText: "Ingrese la cantidad"
            ),
          ),
        ),

        const SizedBox(height: 30),

        ElevatedButton.icon(
          style: primaryButtonStyle().copyWith(
            minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 0)),
            elevation: MaterialStateProperty.all<double>(0),
          ),
          icon: const Icon(Icons.add_chart_rounded),
          label: const Text("Reportar avance"),
          onPressed: () {
          },
        ),
      ],
    );
  }

  
}