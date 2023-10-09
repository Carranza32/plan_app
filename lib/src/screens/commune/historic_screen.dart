import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plan_app/src/constants.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:plan_app/src/controllers/HistoricController.dart';
import 'package:plan_app/src/controllers/SettingsController.dart';
import 'package:plan_app/src/models/user_model.dart';
import 'package:plan_app/src/widgets/drawer_widget.dart';
import 'package:intl/intl.dart';

class HistoricScreen extends StatelessWidget {
  const HistoricScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsController settingsController = Get.find();
    final HistoricController historicController = Get.put(HistoricController());
    
    return Scaffold(
      endDrawer: const DrawerWidget(),
      appBar: AppBar( 
        title: const Text('Puente Algarrobo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text('Histórico OT', style: titleStyle()),
            const SizedBox(height: 20),

            const Text("En esta sección podrás descargar los informes de las ordenes de trabajo cerradas."),

            if(settingsController.selectedRole.value == settingsController.gerente) _buildJefeTerreno(historicController),

            if(settingsController.selectedRole.value == settingsController.pjte || settingsController.selectedRole.value == settingsController.gerente) _buildSupervisor(historicController),

            const SizedBox(height: 30),

            const Chip(
              label: Text('Cumplimiento a la fecha: 30%', style: TextStyle(color: Colors.white)), 
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
            ),


            const SizedBox(height: 30),
            
            SizedBox(
              width: double.infinity,
              height: 600,
              child: Obx(() => 
                (historicController.historics.isNotEmpty) ? _buildDataTable(historicController) : const Center(child: CircularProgressIndicator()
              ))
            )
          ],
        ),
      ),
    );
  }

  Widget _buildJefeTerreno(HistoricController historicController){
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
            if (historicController.professionals.isEmpty) {
              // Muestra un CircularProgressIndicator mientras se carga la lista.
              return const Center(child: CircularProgressIndicator());
            } else {
              return DropdownButtonFormField<UserModel>(
                decoration: formFieldStyle(),
                onChanged: (UserModel? value) {
                  if (value != null) {
                    historicController.selectedprofessionals.value = value;
                  }
                },
                value: historicController.selectedprofessionals.value, // Asegúrate de que este valor esté actualizado según tu lógica.
                items: historicController.professionals.map<DropdownMenuItem<UserModel>>((UserModel user) {
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

  Widget _buildSupervisor(HistoricController historicController){
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
            if (historicController.supervisors.isEmpty) {
              // Muestra un CircularProgressIndicator mientras se carga la lista.
              return const Center(child: CircularProgressIndicator());
            } else {
              return DropdownButtonFormField<UserModel>(
                decoration: formFieldStyle(),
                onChanged: (UserModel? value) {
                  if (value != null) {
                    historicController.selectedSupervisor.value = value;
                  }
                },
                value: historicController.selectedSupervisor.value, // Asegúrate de que este valor esté actualizado según tu lógica.
                items: historicController.supervisors.map<DropdownMenuItem<UserModel>>((UserModel user) {
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

  Widget _buildDataTable(HistoricController historicController){
    DateTime now = DateTime.now();
    
    return DataTable2(
      columnSpacing: 12,
      horizontalMargin: 12,
      minWidth: 400,
      headingRowColor: MaterialStateColor.resolveWith((states) => primaryColor()),
      headingTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      isVerticalScrollBarVisible: true,
      columns: const [
        DataColumn2(
          label: Text('OT'),
        ),
        DataColumn2(
          label: Text('Fecha de término'),
        ),
        DataColumn2(
          label: Text(''),
        ),
      ],

      rows: List<DataRow>.generate(
        historicController.historics.length,
        (index) => DataRow(cells: [
          DataCell(Text(historicController.historics[index].orderNumber ?? '')),

          DataCell(Text(DateFormat('dd-MM-yyyy').format(historicController.historics[index].endDate ?? now))),

          DataCell(
            Align(
              alignment: Alignment.center,
              child: IconButton(
                icon: Icon(Icons.sim_card_download_outlined, color: primaryColor()),
                onPressed: () {
                  Get.showSnackbar(
                    const GetSnackBar(
                      message: 'Archivo descargado',
                      duration: Duration(seconds: 3),
                    ),
                  );
                },
              ),
            )
          ),
        ])
      ),
    );
  }
}