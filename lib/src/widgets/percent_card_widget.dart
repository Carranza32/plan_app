import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:plan_app/src/constants.dart';

// ignore: must_be_immutable
class PercentCardWidget extends StatelessWidget {
  var label = '';
  var percent = 0.1;
  var color = Colors.green;
  var isVertical = false;

  PercentCardWidget({super.key, required this.label, required this.percent, required this.color, this.isVertical = false});

  @override
  Widget build(BuildContext context) {
    var content = null;

    if (isVertical) {
      content = Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularPercentIndicator(
            radius: 35,
            lineWidth: 7.0,
            percent: percent / 100,
            center: Text("$percent%"),
            progressColor: color,
            startAngle: 270,
          ),
          const SizedBox(height: 10),
          Text(label, style: const TextStyle(fontSize: 15), textAlign: TextAlign.center),
          const SizedBox(height: 20),
        ],
      );
    }else{
      content = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: Text(label, style: const TextStyle(fontSize: 18))
          ),
          const SizedBox(width: 20),
          
          Flexible(
            child: CircularPercentIndicator(
              radius: 45,
              lineWidth: 10.0,
              percent: percent / 100,
              center: Text("$percent%"),
              progressColor: color,
              startAngle: 270,
            ),
          )
        ],
      );
    }
    
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: containerCardDecoration(),
      child: content,
    );
  }
}