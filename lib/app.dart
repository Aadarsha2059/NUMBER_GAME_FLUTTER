
import 'package:flutter/material.dart';
import 'package:num_game/view/num_game.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RandomGame(),
    );
  }
}