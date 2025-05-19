import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: RowsColumnView(),
    debugShowCheckedModeBanner: false,
  ));
}

class RowsColumnView extends StatelessWidget {
  const RowsColumnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
            
              flex: 1, // Takes 3 parts out of 6 total
              child: Container(
                color: Colors.black,
                alignment: Alignment.center,
                child: const Text(
                  "Container 1",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Expanded(
              flex: 1, // Takes 2 parts out of 6 total
              child: Container(
                color: Colors.orange,
                alignment: Alignment.center,
                child: const Text(
                  "Container 2",
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
              ),
            ),
            Expanded(
              flex: 1, // Takes 1 part out of 6 total
              child: Container(
                color: Colors.green,
                alignment: Alignment.center,
                child: const Text(
                  "Container 3",
                  style: TextStyle(color: Colors.orange, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
