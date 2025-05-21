import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  String input = "";
  String result = "";

  final List<String> lstText = [
    "C", "*", "/", "<-",
    "7", "8", "9", "-",
    "4", "5", "6", "+",
    "1", "2", "3", "=",
    "0", ".", "%"
  ];

  void onButtonPressed(String value) {
    setState(() {
      if (value == "C") {
        input = "";
        result = "";
      } else if (value == "<-") {
        if (input.isNotEmpty) {
          input = input.substring(0, input.length - 1);
        }
      } else if (value == "=") {
        try {
          result = _evaluate(input);
          input = result;
        } catch (e) {
          result = "Error";
        }
      } else {
        input += value;
      }
    });
  }

  String _evaluate(String expr) {
    try {
      expr = expr.replaceAll('%', '/100');
      final parsed = double.parse(_calculateExpression(expr));
      return parsed.toStringAsFixed(2).replaceAll(RegExp(r'\.00$'), '');
    } catch (e) {
      return 'Error';
    }
  }

  String _calculateExpression(String expr) {
    try {
      final exp = expr.replaceAll('×', '*').replaceAll('÷', '/');
      return (double.parse(eval(exp).toString())).toString();
    } catch (e) {
      return '0';
    }
  }

  dynamic eval(String expr) {
    // This is a dummy parser. Use a proper expression parser in real apps.
    return double.tryParse(expr) ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: screenHeight - kToolbarHeight - 24, // adjust for AppBar
            ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
                  child: Text(
                    input,
                    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
                if (result.isNotEmpty)
                  Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Text(
                      "=$result",
                      style: const TextStyle(fontSize: 24, color: Colors.grey),
                    ),
                  ),
                const SizedBox(height: 10),
                GridView.count(
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.2,
                  children: lstText.map((text) {
                    final isOperator = "+-*/=%=".contains(text);
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isOperator ? Colors.blue : Colors.amber,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () => onButtonPressed(text),
                      child: Text(
                        text,
                        style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
