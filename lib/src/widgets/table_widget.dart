import 'package:flutter/material.dart';
import 'package:plan_app/src/constants.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(color: Colors.white);

    return Table(
      border: TableBorder.all(color: Colors.grey),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          decoration: BoxDecoration(
            color: primaryColor(),
          ),
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Text('Avance programado', textAlign: TextAlign.center, style: style),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text('Avance real', textAlign: TextAlign.center, style: style),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text('IP', textAlign: TextAlign.center, style: style),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text('IP anterior', textAlign: TextAlign.center, style: style),
            ),
          ]
        ),
        TableRow(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text('90,30%', textAlign: TextAlign.center),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text('23,00%', textAlign: TextAlign.center),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text('36,6%', textAlign: TextAlign.center),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text('38,2%', textAlign: TextAlign.center),
            ),
          ]
        ),
      ],
    );
  }
}