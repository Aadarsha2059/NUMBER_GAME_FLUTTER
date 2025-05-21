import 'package:flutter/material.dart';

class DataTableView extends StatelessWidget {
  const DataTableView({super.key});


  Widget buildDataTable() {
    return DataTable(
      border: TableBorder.all(color: Colors.black),
      columns: const [
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Roll no')),
      ],
      rows: const [
        DataRow(cells: [
          DataCell(Text("aaadarsha")),
          DataCell(Text("12")),
        ],
        ),
        DataRow(cells: [
          DataCell(Text('Mary')),
          DataCell(Text('11')),
        ])
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: buildDataTable(),
        ),
      ),
    );
  }
}
