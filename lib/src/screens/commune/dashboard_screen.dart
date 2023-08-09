import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plan_app/src/constants.dart';
import 'package:plan_app/src/widgets/alert_widget.dart';
import 'package:plan_app/src/widgets/drawer_widget.dart';
import 'package:plan_app/src/widgets/line_chart_widget.dart';
import 'package:plan_app/src/widgets/percent_card_widget.dart';
import 'package:plan_app/src/widgets/table_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

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
              Text('Bienvenido, José', style: titleStyle()),
              const SizedBox(height: 20),
              const AlertCardWidget(),
              const SizedBox(height: 25),
              const TableWidget(),

              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 3,
                    child: PercentCardWidget(label: "Avance programado", percent: 90.3, color: Colors.yellow),
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                    flex: 3,
                    child: PercentCardWidget(label: "Avance probable", percent: 80.2, color: Colors.yellow),
                  )
                ],
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 3,
                    child: PercentCardWidget(label: "Avance real", percent: 23.0, color: Colors.red),
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                    flex: 3,
                    child: PercentCardWidget(label: "IP", percent: 25.5, color: Colors.red),
                  )
                ],
              ),
              const SizedBox(height: 25),
              
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 3,
                    child: Text("Avance de obra Puente"),
                  ),
                  Flexible(
                    flex: 3,
                    child: Text("Avance de obra Puente"),
                  ),
                ],
              ),
              const SizedBox(
                height: 300,
                child: LineChartWidget(),
              ),

              const SizedBox(height: 25),

              OutlinedButton(
                onPressed: () {
                  Get.toNamed('/commune/velocity-curves');
                },
                style: outlineButtonStyle().copyWith(
                  minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 0)),
                ),
                child: const Text("Ver curvas de velocidad"),
              ),
            ],
          ),
        )
      ),
    );
  }
}