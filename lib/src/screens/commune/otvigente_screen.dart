import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plan_app/src/constants.dart';
import 'package:plan_app/src/controllers/SettingsController.dart';
import 'package:plan_app/src/controllers/WorkOrderController.dart';
import 'package:plan_app/src/models/user_model.dart';
import 'package:plan_app/src/widgets/drawer_widget.dart';

class OTVigenteScreen extends StatelessWidget {
  const OTVigenteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(color: Colors.white);
    final SettingsController settingsController = Get.find();
    final WorkController workController = Get.put(WorkController());

    return Scaffold(
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

            if(settingsController.selectedRole.value == settingsController.gerente) _buildJefeTerreno(workController),

            const SizedBox(height: 10),

            _buildSupervisor(workController),

            const SizedBox(height: 30),

            Obx(() => 
                (workController.workOrder.value.id != null) ? 
                Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: _buildTableRows(workController, style),
                )
               : const Center(child: CircularProgressIndicator())
            ),

            
          ],
        ),
      ),
    );
  }

  Widget _buildJefeTerreno(WorkController workController){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),

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
          child: Obx(() {
            if (workController.professionals.isEmpty) {
              // Muestra un CircularProgressIndicator mientras se carga la lista.
              return const Center(child: CircularProgressIndicator());
            } else {
              return DropdownButtonFormField<UserModel>(
                decoration: formFieldStyle(),
                onChanged: (UserModel? value) {
                  if (value != null) {
                    workController.selectedprofessionals.value = value;
                  }
                },
                value: workController.selectedprofessionals.value, // Asegúrate de que este valor esté actualizado según tu lógica.
                items: workController.professionals.map<DropdownMenuItem<UserModel>>((UserModel user) {
                  return DropdownMenuItem<UserModel>(
                    value: user,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Text(user.fullName ?? ''),
                    ),
                  );
                }).toList(),
              );
            }
          }),
        ),
      ],
    );
  }

  Widget _buildSupervisor(WorkController workController){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),

        const Text(
          "Supervisor",
          style: TextStyle(
            fontSize: 18,
          ),
        ),

        const SizedBox(height: 20),
        Material(
          borderRadius: BorderRadius.circular(6),
          elevation: 2,
          child: Obx(() {
            if (workController.supervisors.isEmpty) {
              // Muestra un CircularProgressIndicator mientras se carga la lista.
              return const Center(child: CircularProgressIndicator());
            } else {
              return DropdownButtonFormField<UserModel>(
                decoration: formFieldStyle(),
                onChanged: (UserModel? value) {
                  if (value != null) {
                    workController.selectedSupervisor.value = value;
                  }
                },
                value: workController.selectedSupervisor.value, // Asegúrate de que este valor esté actualizado según tu lógica.
                items: workController.supervisors.map<DropdownMenuItem<UserModel>>((UserModel user) {
                  return DropdownMenuItem<UserModel>(
                    value: user,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Text(user.fullName ?? ''),
                    ),
                  );
                }).toList(),
              );
            }
          }),
        ),
      ],
    );
  }

  List<TableRow> _buildTableRows(WorkController workController, TextStyle style){
    List<TableRow> rows = [];

    rows.add(
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
            child: Text('Aporte al avance en OT', textAlign: TextAlign.center, style: style),
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
    );

    rows.add(
      TableRow(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(workController.workOrder.value.orderNumber.toString(), textAlign: TextAlign.center),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(workController.workOrder.value.startDate.toString(), textAlign: TextAlign.center),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text('13%', textAlign: TextAlign.center),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text('1.9%', textAlign: TextAlign.center),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: IconButton(
              onPressed: () => Get.toNamed('/commune/otvigente/details', arguments: workController.workOrder.value),
              icon: Icon(Icons.remove_red_eye_outlined, color: Colors.grey[700]),
            ),
          ),
        ]
      )
    );

    return rows;
  }
}

