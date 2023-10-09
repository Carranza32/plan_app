import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plan_app/src/constants.dart';
import 'package:plan_app/src/models/current_workorder_model.dart';
import 'package:plan_app/src/widgets/drawer_widget.dart';

class OTVigenteDetailScreen extends StatelessWidget {
  const OTVigenteDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CurrentWorkOrderModel data = Get.arguments as CurrentWorkOrderModel;

    const style = TextStyle(color: Colors.white);

    return Scaffold(
      endDrawer: const DrawerWidget(),
      appBar: AppBar( 
        title: const Text('Puente Algarrobo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data.orderNumber ?? '', style: titleStyle()),
            const SizedBox(height: 5),
            Text('2 semanas', style: titleStyle().copyWith(
              fontSize: 14,
            )),

            const SizedBox(height: 30),

            const Row(
              children: [
                Chip(
                  label: Text('PJTE: Ariel Parra', style: TextStyle(color: Colors.white)), 
                  backgroundColor: Color(0xffdfc124),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                ),

                SizedBox(width: 15),

                Chip(
                  avatar: Icon(Icons.calendar_month_outlined, color: Colors.white, size: 18),
                  label: Text('Inicio OT: 17-07-2023', style: TextStyle(color: Colors.white)), 
                  backgroundColor: Color(0xffdfc124),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),
            Text("Actividad", style: TextStyle(color: primaryColor())),
            const SizedBox(height: 10),

            Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: _buildActivities(data, style)
            ),
          
            const SizedBox(height: 30),

            Row(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: Colors.amber[100],
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),

                const SizedBox(width: 10),

                Text('Ruta crítica', style: TextStyle(color: Colors.grey[700])),
              ],
            )
          ],
        ),
      ),
    );
  }
}

List<TableRow> _buildActivities(CurrentWorkOrderModel data, style){
  List<TableRow> rows = [];

  rows.add(
    TableRow(
      decoration: BoxDecoration(
        color: primaryColor(),
      ),
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Text('Actividades', textAlign: TextAlign.center, style: style),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Text('Inicio actividad en programa maestro', textAlign: TextAlign.center, style: style),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Text('', textAlign: TextAlign.center, style: style),
        ),
      ]
    )
  );

  data.activities!.map((e) => 
    rows.add(
      TableRow(
        decoration: BoxDecoration(
          color: (e.activity!.isCriticalRoute == 1) ? Colors.amber[100] : Colors.white,
        ),
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(e.activity!.name ?? '', textAlign: TextAlign.center),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(e.activity!.startDate.toString(), textAlign: TextAlign.center),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: IconButton(
              onPressed: () => Get.toNamed('/commune/activities', arguments: e.activity),
              icon: Icon(Icons.remove_red_eye_outlined, color: Colors.grey[700]),
            ),
          ),
        ]
      )
    )
  ).toList();

  
  

  return rows;
}