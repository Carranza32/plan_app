import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plan_app/src/constants.dart';
import 'package:plan_app/src/widgets/drawer_widget.dart';
import 'package:plan_app/src/widgets/line_chart_widget.dart';
import 'package:plan_app/src/widgets/percent_card_widget.dart';

class VelocityCurvesDetailsScreen extends StatelessWidget {
  const VelocityCurvesDetailsScreen({super.key});

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

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 2,
                    child: PercentCardWidget(label: "Avance programado", percent: 90, color: Colors.yellow, isVertical: true),
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                    flex: 2,
                    child: PercentCardWidget(label: "Avance real", percent: 60, color: Colors.red, isVertical: true),
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                    flex: 2,
                    child: PercentCardWidget(label: "IP", percent: 66.7, color: Colors.red, isVertical: true),
                  ),
                ],
              ),

              const SizedBox(
                height: 300,
                child: LineChartWidget(),
              ),

              const SizedBox(height: 25),

              Align(
                alignment: Alignment.center,
                child: OutlinedButton(
                  onPressed: () {
                  },
                  style: outlineButtonStyle(),
                  child: const Text("Exportar gráfico"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}