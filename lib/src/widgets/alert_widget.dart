import 'package:flutter/material.dart';
import 'package:plan_app/src/constants.dart';

class AlertCardWidget extends StatelessWidget {
  const AlertCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: containerCardDecoration(),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Alerta', style: TextStyle(fontSize: 18, color: primaryColor())),
              const SizedBox(height: 10),
              const Text("Probable caída indicador utilidad de obra bajo\nel 50% ya que se cumple la condición de:\nAvance REAL >= 40% \nIP < 40% en semana de control y 3 anteriore")
            ],
          )
        ],
      ),
    );
  }
}