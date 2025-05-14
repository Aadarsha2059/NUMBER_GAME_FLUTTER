import 'package:flutter/material.dart';

class FlexibleExpendedView extends StatelessWidget {
  const FlexibleExpendedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Container 1"),
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },

              child: Container(
                width: double.infinity,
                color: Colors.red,
                child: Center(
                  child: Text("Container 1", style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
          ),

          Expanded(
            child: GestureDetector(
              onDoubleTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Container 2 clicked"),
                    backgroundColor: Colors.red,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                color: Colors.yellow,
                alignment: Alignment.center,
                child: Center(
                  child: Text("Container 2", style: TextStyle(fontSize: 30)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
