import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plan_app/src/constants.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/rendering.dart';
import 'package:plan_app/src/widgets/drawer_widget.dart';



class HistoricScreen extends StatelessWidget {
  const HistoricScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              Text('Histórico OT', style: titleStyle()),
              const SizedBox(height: 20),

              const Text("En esta sección podrás descargar los informes de las ordenes de trabajo cerradas."),

              const SizedBox(height: 30),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Profesional jefe de terreno",
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
                child: DataTable2(
                  columnSpacing: 12,
                  horizontalMargin: 12,
                  minWidth: 600,
                  headingRowColor: MaterialStateColor.resolveWith((states) => primaryColor()),
                  headingTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  isVerticalScrollBarVisible: true,
                  columns: const [
                    DataColumn2(
                      label: Text('OT'),
                      size: ColumnSize.L,
                    ),
                    DataColumn(
                      label: Text('Fecha de término'),
                    ),
                    DataColumn(
                      label: Text(''),
                    ),
                  ],

                  rows: List<DataRow>.generate(
                    30,
                    (index) => DataRow(cells: [
                      DataCell(Text('OT $index')),

                      const DataCell(Text('23/05/2023')),

                      DataCell(IconButton(
                        icon: Icon(Icons.sim_card_download_outlined, color: primaryColor()),
                        onPressed: () {
                          Get.showSnackbar(
                            const GetSnackBar(
                              message: 'Archivo descargado',
                              duration: Duration(seconds: 3),
                            ),
                          );
                        },
                      )),
                    ])
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}