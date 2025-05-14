import 'package:flutter/material.dart';

class ContainerView extends StatelessWidget {
  const ContainerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 192, 190, 183),
      body:SafeArea(
        child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.amber,
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
            alignment: Alignment.center,
            child: const Text("I am a container"),
          ),
        )
      )
    );
  }
}