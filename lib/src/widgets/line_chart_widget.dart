import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DChartLine(
      data: const [
        {
          'id': 'Line',
          'data': [
              {'domain': 0, 'measure': 4.1},
              {'domain': 2, 'measure': 4},
              {'domain': 3, 'measure': 6},
              {'domain': 4, 'measure': 1},
          ],
        },
      ],
      lineColor: (lineData, index, id) => Colors.amber,
    );
  }
}