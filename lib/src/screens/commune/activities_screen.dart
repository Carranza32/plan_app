import 'package:flutter/material.dart';
import 'package:plan_app/src/constants.dart';
import 'package:plan_app/src/widgets/drawer_widget.dart';
import 'package:plan_app/src/widgets/generate_table_widget.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            ],
          ),
        ),
      ),
    );
  }

  
}