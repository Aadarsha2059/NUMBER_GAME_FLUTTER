import 'package:flutter/material.dart';

class DataTableView extends StatelessWidget {
  const DataTableView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Centered DataTable")),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: DataTable(
              border: TableBorder.all(color: Colors.black),
              columns: const [
                DataColumn(label: Center(child: Text('Name'))),
                DataColumn(label: Center(child: Text('Roll no'))),
              ],
              rows: const [
                DataRow(
                  cells: [
                    DataCell(Center(child: Text("aaadarsha"))),
                    DataCell(Center(child: Text("12"))),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Center(child: Text('Mary'))),
                    DataCell(Center(child: Text('11'))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: DataTableView(),
    debugShowCheckedModeBanner: false,
  ));
}
