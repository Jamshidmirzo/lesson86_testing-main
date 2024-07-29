import 'package:flutter/material.dart';
import 'package:lesson86_testing/controller/calculator.dart';

void main() {
  // final calculator = Calculator();

  // print(calculator.add(7, 9)); // 16
  // print(calculator.subtract(7, 9)); //-2

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final aController = TextEditingController();
  final bController = TextEditingController();
  final calculator = Calculator();
  int? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              key: const ValueKey("a"),
              // enabled: false,
              controller: aController,
            ),
            const SizedBox(height: 10),
            TextField(
              key: const ValueKey("b"),
              controller: bController,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                FilledButton(
                  key: const ValueKey("+"),
                  onPressed: () {
                    setState(() {
                      int a = int.parse(aController.text);
                      int b = int.parse(bController.text);
                      result = calculator.add(a, b);
                    });
                  },
                  child: const Text("+"),
                ),
                FilledButton(
                  key: const ValueKey("-"),
                  onPressed: () {
                    setState(() {
                      int a = int.parse(aController.text);
                      int b = int.parse(bController.text);
                      result = calculator.subtract(a, b);
                    });
                  },
                  child: const Text("-"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (result != null)
              Text(key: const ValueKey("result"), "Result: $result"),
          ],
        ),
      ),
    );
  }
}
