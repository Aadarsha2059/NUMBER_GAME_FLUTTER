import 'dart:math';
import 'package:flutter/material.dart';

class RandomGame extends StatefulWidget {
  const RandomGame({super.key});

  @override
  State<RandomGame> createState() => _RandomGameState();
}

class _RandomGameState extends State<RandomGame> {
  int numberOne = 0;
  int numberTwo = 0;
  int clicks = 0;
  int scoreA = 0;
  int scoreB = 0;
  String winner = '';
  final int maxClicks = 10;
  final Random random = Random();

  List<int> historyA = [];
  List<int> historyB = [];

  List<bool> turnOrder = []; // true = A's turn, false = B's turn

  void generateTurnOrder() {
    turnOrder = List.filled(5, true) + List.filled(5, false);
    turnOrder.shuffle(random); // Shuffle the turn order randomly
  }

  void generateNumbers() {
    numberOne = random.nextInt(100);
    int offset = random.nextInt(50) + 1; // Difference of 1–50
    numberTwo = (random.nextBool() ? numberOne + offset : numberOne - offset).clamp(0, 99);
    if (random.nextBool()) {
      int temp = numberOne;
      numberOne = numberTwo;
      numberTwo = temp;
    }
  }

  void handleClick(bool isButtonA) {
    if (clicks >= maxClicks || isButtonA != turnOrder[clicks]) return;

    setState(() {
      if (isButtonA) {
        if (numberOne > numberTwo) scoreA++;
      } else {
        if (numberTwo > numberOne) scoreB++;
      }

      historyA.add(numberOne);
      historyB.add(numberTwo);

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

  void resetGame() {
    setState(() {
      clicks = 0;
      scoreA = 0;
      scoreB = 0;
      winner = '';
      historyA.clear();
      historyB.clear();
      generateTurnOrder();
      generateNumbers();
    });
  }

  @override
  void initState() {
    super.initState();
    generateTurnOrder();
    generateNumbers();
  }

  @override
  Widget build(BuildContext context) {
    bool isATurn = clicks < turnOrder.length ? turnOrder[clicks] : true;

    return MaterialApp(
      title: 'Material Game',
      home: Scaffold(
        appBar: AppBar(title: const Text("Number Game")),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Turn: ${isATurn ? 'Button A' : 'Button B'}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: isATurn && clicks < maxClicks ? () => handleClick(true) : null,
                  child: Text('Button A: $numberOne'),
                ),
                ElevatedButton(
                  onPressed: !isATurn && clicks < maxClicks ? () => handleClick(false) : null,
                  child: Text('Button B: $numberTwo'),
                ),
                const SizedBox(height: 20),
                Text('Clicks: $clicks / $maxClicks'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(winner.isEmpty ? 'Winner will appear here' : winner),
                ),
                const SizedBox(height: 30),
                Text('Button A Numbers: ${historyA.join(', ')}'),
                const SizedBox(height: 10),
                Text('Button B Numbers: ${historyB.join(', ')}'),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: resetGame,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Restart Game'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
