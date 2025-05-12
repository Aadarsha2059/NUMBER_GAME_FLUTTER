import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: RandomGame()));
}

class RandomGame extends StatefulWidget {
  const RandomGame({super.key});

  @override
  State<RandomGame> createState() => _RandomGameState();
}

class _RandomGameState extends State<RandomGame> {
  final Random random = Random();
  final int maxClicks = 10;

  int numberA = 0;
  int numberB = 0;
  int clicks = 0;
  int scoreA = 0;
  int scoreB = 0;
  String winner = '';
  List<bool> turnOrder = [];

  void initGame() {
    scoreA = 0;
    scoreB = 0;
    clicks = 0;
    winner = '';
    turnOrder = List.filled(5, true) + List.filled(5, false);
    turnOrder.shuffle();
    generateNumbers();
  }

  void generateNumbers() {
    numberA = random.nextInt(100);
    numberB = random.nextInt(100);
  }

  void handleClick(bool isA) {
    if (clicks >= maxClicks || turnOrder[clicks] != isA) return;

    setState(() {
      if (numberA > numberB && isA) scoreA++;
      if (numberB > numberA && !isA) scoreB++;

      clicks++;
      if (clicks == maxClicks) {
        if (scoreA > scoreB) {
          winner = 'Winner: Button A';
        } else if (scoreB > scoreA) {
          winner = 'Winner: Button B';
        } else {
          winner = 'It\'s a tie!';
        }
      } else {
        generateNumbers();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    initGame();
  }

  @override
  Widget build(BuildContext context) {
    bool isATurn = clicks < maxClicks ? turnOrder[clicks] : true;

    return Scaffold(
      appBar: AppBar(title: const Text('Random Game')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Turn: ${isATurn ? "A" : "B"}'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: isATurn && clicks < maxClicks ? () => handleClick(true) : null,
              child: Text('Button A: $numberA'),
            ),
            ElevatedButton(
              onPressed: !isATurn && clicks < maxClicks ? () => handleClick(false) : null,
              child: Text('Button B: $numberB'),
            ),
            const SizedBox(height: 10),
            Text('Score A: $scoreA'),
            Text('Score B: $scoreB'),
            Text('Clicks: $clicks / $maxClicks'),
            const SizedBox(height: 10),
            Text(winner),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  initGame();
                });
              },
              child: const Text('Restart'),
            ),
          ],
        ),
      ),
    );
  }
}
