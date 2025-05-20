import 'package:flutter/material.dart';

class GridViewPage extends StatelessWidget {
  const GridViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView Example"),
      
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          children: List.generate(20, (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.green.shade500,
                child: Center(
                  child: Text(
                    'Item $index',
                    style: const TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
