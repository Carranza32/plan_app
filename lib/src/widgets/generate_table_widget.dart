// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:plan_app/src/constants.dart';

class GenerateTableWidget extends StatelessWidget {
  List<List<String?>> rows;
  // ignore: prefer_typing_uninitialized_variables
  var header;

  GenerateTableWidget({super.key, required this.rows, this.header });

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: _buildTable(rows, header: header),
    );
  }

  List<TableRow> _buildTable(items, {header}) {
    var tableRows = <TableRow>[]; 

    if (header != null) {
      const style = TextStyle(color: Colors.white);

      var headerRows = <Widget>[];
      
      for (var element in header) {
        headerRows.add(
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(element, textAlign: TextAlign.center, style: style),
          ),
        );
      }

      tableRows.add(
        TableRow(
          decoration: BoxDecoration(
            color: primaryColor(),
          ),
          children: headerRows,
        )
      );
    }

    for (var index = 0; index < items.length; index++) {
      final element = items[index];
      final isGrayBackground = index % 2 == 1; 
      
      var dataRows = <Widget>[];
      
      for (var data in element) {
        final isLast = element.last == data;
        final textAlign = isLast ? TextAlign.center : TextAlign.center;

        dataRows.add(
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(data, textAlign: textAlign),
          ),
        );
      }// Alternar entre celdas blancas y grises

      tableRows.add(
        TableRow(
          decoration: BoxDecoration(
            color: isGrayBackground ? Colors.grey[100] : Colors.white, // Establecer el color de fondo
            border: const Border(
              top: BorderSide(color: Color.fromARGB(155, 219, 219, 219), width: 2),
            ),
          ),
          children: dataRows,
        ),
      );
    }

    return tableRows;
  }
}