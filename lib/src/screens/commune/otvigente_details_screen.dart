import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plan_app/src/constants.dart';
import 'package:plan_app/src/widgets/drawer_widget.dart';

class OTVigenteDetailScreen extends StatelessWidget {
  const OTVigenteDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(color: Colors.white);

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
              Text('OT 13', style: titleStyle()),
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
                    label: Text('17-07-2023', style: TextStyle(color: Colors.white)), 
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
                children: [
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
                  ),
                  TableRow(
                    decoration: BoxDecoration(
                      color: Colors.amber[100],
                    ),
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text('Puertas', textAlign: TextAlign.center),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text('01/06/2023', textAlign: TextAlign.center),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: IconButton(
                          onPressed: () => Get.toNamed('/commune/activities'),
                          icon: Icon(Icons.remove_red_eye_outlined, color: Colors.grey[700]),
                        ),
                      ),
                    ]
                  ),
                  TableRow(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text('Ventanas', textAlign: TextAlign.center),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text('24/07/2023', textAlign: TextAlign.center),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: IconButton(
                          onPressed: () => Get.toNamed('/commune/activities'),
                          icon: Icon(Icons.remove_red_eye_outlined, color: Colors.grey[700]),
                        ),
                      ),
                    ]
                  ),
                  TableRow(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text('Lavaplatos', textAlign: TextAlign.center),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text('20/07/2023', textAlign: TextAlign.center),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: IconButton(
                          onPressed: () => Get.toNamed('/commune/activities'),
                          icon: Icon(Icons.remove_red_eye_outlined, color: Colors.grey[700]),
                        ),
                      ),
                    ]
                  ),
                ],
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
      ),
    );
  }
}