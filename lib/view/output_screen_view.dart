import 'package:flutter/material.dart';
import 'package:num_game/model/student.dart';

class OutputViewScreen extends StatelessWidget {
  const OutputViewScreen({super.key, required this.student});
  final Student student;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Output View')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("First Name:${student.fname}", style: TextStyle(fontSize: 18)),

            Text("Last Name: ${student.lname}", style: TextStyle(fontSize: 20)),

            Text("City: ${student.city}", style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
